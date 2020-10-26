require 'json'
require_relative 'user'

class UserReader
  def read_users(filename)
    array = JSON.parse(File.read(filename))
    array.map { |hash| User.new(hash) }
  end
end
