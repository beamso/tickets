require 'json'
require_relative 'ticket'

class TicketReader
  def read_tickets(filename)
    array = JSON.parse(File.read(filename))
    array.map { |hash| Ticket.new(hash) }
  end
end
