require_relative 'ticket'
require_relative 'object_printer'

class TicketPrinter < ObjectPrinter
  def initialize
    super(Ticket)
  end
end
