require 'json'

class Reader
  def initialize(clazz)
    @clazz = clazz
  end

  def read(filename)
    array = JSON.parse(File.read(filename))
    array.map { |hash| @clazz.new(hash) }
  end
end
