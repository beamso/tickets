require 'stringio'

class ObjectPrinter
  def initialize(object_class)
    @object_class = object_class
  end

  def print(object)
    output = StringIO.new
    keys = @object_class.keys
    longest_key_length = keys.map(&:length).max
    ljust = longest_key_length + 2
    keys.each do |key|
      output.puts("#{key.ljust(ljust)} #{object.send(key.to_sym)}")
    end
    output.string
  end

  def print_keys
    output = StringIO.new
    keys = @object_class.keys
    keys.each { |key| output.puts(key) }
    output.string
  end
end
