require_relative 'reader'
require_relative 'organization'

class OrganizationReader < Reader
  def initialize
    super(Organization)
  end
end
