class Searcher
  def initialize(store)
    @store = store
  end

  def search(key, value)
    raise "No key #{key} for #{@store.instance_class}" unless @store.instance_class.keys.include?(key)

    @store.items.select do |user|
      user_value = user.send(key.to_sym)
      if user_value.is_a?(Enumerable)
        user_value.include?(value)
      else
        user_value.to_s == value
      end
    end
  end
end
