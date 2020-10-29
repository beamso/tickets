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
end
