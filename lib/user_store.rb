require_relative 'user'
require_relative 'user_reader'
require_relative 'store'

class UserStore < Store
  def initialize(filename)
    super(User, UserReader, filename)
  end

  def related_to_user(_user)
    []
  end

  def related_to_organization(organization)
    @items.select { |item| item.organization_id == organization._id }
  end

  def related_to_ticket(ticket)
    @items.select { |item| item._id == ticket.submitter_id || item._id == ticket.assignee_id }
  end
end
