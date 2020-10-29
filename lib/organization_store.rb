require_relative 'organization'
require_relative 'organization_reader'
require_relative 'store'

class OrganizationStore < Store
  def initialize(filename)
    super(Organization, OrganizationReader, filename)
  end
end
