require_relative 'reader'
require_relative 'ticket'

class TicketReader < Reader
  def initialize
    super(Ticket)
  end
end
