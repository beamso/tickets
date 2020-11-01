require_relative 'organization'
require_relative 'organization_reader'
require_relative 'store'

class OrganizationStore < Store
  def initialize(filename)
    super(Organization, OrganizationReader, filename)
  end

  def related_to_user(user)
    @items.select { |organization| organization._id == user.organization_id }
  end

  def related_to_organization(_organization)
    []
  end

  def related_to_ticket(ticket)
    @items.select { |organization| organization._id == ticket.organization_id }
  end
end
