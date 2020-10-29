require_relative 'user'
require_relative 'object_printer'

class UserPrinter < ObjectPrinter
  def initialize
    super(User)
  end
end
