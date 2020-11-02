require_relative 'lib/search_tool_impl'

class SearchTool
  OBJECTS = %w[users tickets organizations].freeze
  COMMANDS = %w[-keys -search].freeze

  def execute(command, object, options)
    SearchToolImpl.new.execute(command, object, options)
  end

  def self.invalid_usage
    warn 'Usage: search_tool [-keys|-search] [object] <key> <value>'
    warn "objects are #{OBJECTS}"
    warn 'key - a key belonging to an object'
    warn 'value - value to find belonging to a key'
    exit(1)
  end
end

SearchTool.invalid_usage if ARGV.length <= 1

command = ARGV[0]
object = ARGV[1]
unless SearchTool::COMMANDS.include?(command)
  warn "unknown command \"#{command}\""
  SearchTool.invalid_usage
end
unless SearchTool::OBJECTS.include?(object)
  warn "unknown object \"#{object}\""
  SearchTool.invalid_usage
end

options = case command
          when '-keys'
            SearchTool.invalid_usage if ARGV.length != 2
            {}
          when '-search'
            SearchTool.invalid_usage if ARGV.length != 4
            { key: ARGV[2], value: ARGV[3] }
          end

SearchTool.new.execute(command, object, options)
