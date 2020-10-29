class Store
  attr_reader :instance_class, :items

  def initialize(instance_class, reader_class, filename)
    @instance_class = instance_class
    @items = reader_class.new.read(filename)
  end
end
