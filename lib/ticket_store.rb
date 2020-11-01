require_relative 'ticket'
require_relative 'ticket_reader'
require_relative 'store'

class TicketStore < Store
  def initialize(filename)
    super(Ticket, TicketReader, filename)
  end

  def tickets_submitted(user)
    @items.select { |ticket| ticket.submitter_id == user._id }
  end

  def tickets_assigned(user)
    @items.select { |ticket| ticket.assignee_id == user._id }
  end

  def tickets_for_organization(organization)
    @items.select { |ticket| ticket.organization_id == organization._id }
  end

  def related_to_user(user)
    tickets_submitted(user) + tickets_assigned(user)
  end

  def related_to_organization(organization)
    tickets_for_organization(organization)
  end

  def related_to_ticket(_ticket)
    []
  end
end
