require_relative 'user'
require_relative 'user_reader'
require_relative 'store'

class UserStore < Store
  def initialize(filename)
    super(User, UserReader, filename)
  end
end
