require_relative 'user'
require_relative 'reader'

class UserReader < Reader
  def initialize
    super(User)
  end
end
