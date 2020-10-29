require_relative 'organization'
require_relative 'organization_printer'
require_relative 'organization_store'
require_relative 'ticket'
require_relative 'ticket_printer'
require_relative 'ticket_store'
require_relative 'user'
require_relative 'user_printer'
require_relative 'user_store'

require_relative 'searcher'

require 'byebug'

class SearchToolImpl
  def initialize
    @organization_store = OrganizationStore.new(File.join(File.dirname(__FILE__), '..', 'organizations.json'))
    @ticket_store = TicketStore.new(File.join(File.dirname(__FILE__), '..', 'tickets.json'))
    @user_store = UserStore.new(File.join(File.dirname(__FILE__), '..', 'users.json'))
  end

  def execute(command, object, options)
    keys(object) if command == '-keys'
    search(object, options[:key], options[:value]) if command == '-search'
  end

  private

  def search(object, key, value)
    searcher = Searcher.new(store(object))
    items = searcher.search(key, value)
    printer = printer_class(object).new
    puts "Search results for object #{object}, key #{key}, value #{value}"
    items.each { |item| puts printer.print(item) }
  end

  def keys(object)
    printer = printer_class(object)
    puts "Keys for #{object.capitalize} are:"
    puts printer.new.print_keys
  end

  def store(object)
    case object
    when 'users'
      @user_store
    when 'tickets'
      @ticket_store
    when 'organizations'
      @organization_store
    end
  end

  def printer_class(object)
    case object
    when 'users'
      UserPrinter
    when 'tickets'
      TicketPrinter
    when 'organizations'
      OrganizationPrinter
    end
  end
end
