require_relative 'lib/search_tool_impl'

class SearchTool
  OBJECTS = %w[users tickets organizations].freeze
  COMMANDS = %w[-keys -search].freeze

  def execute(command, object, options)
    SearchToolImpl.new.execute(command, object, options)
  end

  def self.invalid_usage
    puts 'Usage: search_tool [-keys|-search] [object] <key> <value>'
    puts "objects are #{OBJECTS}"
    puts 'key - a key belonging to an object'
    puts 'value - value to find belonging to a key'
    exit(1)
  end
end

SearchTool.invalid_usage if ARGV.length <= 1

command = ARGV[0]
object = ARGV[1]
SearchTool.invalid_usage unless SearchTool::COMMANDS.include?(command)
SearchTool.invalid_usage unless SearchTool::OBJECTS.include?(object)

options = case command
          when '-keys'
            SearchTool.invalid_usage if ARGV.length != 2
            {}
          when '-search'
            SearchTool.invalid_usage if ARGV.length != 4
            { key: ARGV[2], value: ARGV[3] }
          end

SearchTool.new.execute(command, object, options)
