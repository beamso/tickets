require_relative 'organization'
require_relative 'object_printer'

class OrganizationPrinter < ObjectPrinter
  def initialize
    super(Organization)
  end
end
