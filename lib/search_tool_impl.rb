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

class SearchToolImpl
  def initialize
    current_directory = File.dirname(__FILE__)
    @organization_store = OrganizationStore.new(File.join(current_directory, '..', 'organizations.json'))
    @ticket_store = TicketStore.new(File.join(current_directory, '..', 'tickets.json'))
    @user_store = UserStore.new(File.join(current_directory, '..', 'users.json'))
  end

  def execute(command, object, options)
    keys(object) if command == '-keys'
    search(object, options[:key], options[:value]) if command == '-search'
  end

  private

  def search(object, key, value)
    object_store = store(object)
    searcher = Searcher.new(object_store)
    items = searcher.search(key, value)
    puts "Search results for object #{object}, key #{key}, value #{value}:"
    puts 'No results' if items.empty?
    items.each do |item|
      puts item.print
      puts 'Related items:'
      related_items(object_store, item)
      puts ''
    end
  end

  def related_items(object_store, item)
    other_stores = other_stores(object_store)
    other_stores.each do |store|
      print_related_items_by_store(store, item)
    end
  end

  def print_related_items_by_store(store, item)
    related_items = related_items_by_store(store, item)
    related_items.each do |related_item|
      puts related_item.print_short
    end
  end

  def related_items_by_store(store, item)
    if item.is_a?(Ticket) # rubocop:disable Style/CaseLikeIf
      store.related_to_ticket(item)
    elsif item.is_a?(User)
      store.related_to_user(item)
    elsif item.is_a?(Organization)
      store.related_to_organization(item)
    else
      []
    end
  end

  def keys(object)
    object_class = object_class(object)
    puts "Keys for #{object.capitalize} are:"
    puts object_class.print_keys
  end

  def store(object_name)
    {
      'users' => @user_store,
      'tickets' => @ticket_store,
      'organizations' => @organization_store
    }[object_name]
  end

  def object_class(object_name)
    {
      'users' => User,
      'tickets' => Ticket,
      'organizations' => Organization
    }[object_name]
  end

  def other_stores(store)
    store_array = [@organization_store, @ticket_store, @user_store]
    store_array.delete(store)
    store_array
  end
end
