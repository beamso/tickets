require_relative 'spec_helper'
require_relative '../lib/ticket_store'

RSpec.describe TicketStore do
  describe '.instance_class' do
    let(:ticket_reader) { instance_double(TicketReader) }

    before do
      allow(TicketReader).to receive(:new).and_return(ticket_reader)
      allow(ticket_reader).to receive(:read).and_return([:bar])
    end

    subject { described_class.new('a_filename').instance_class }

    it 'returns the expected class' do
      expect(subject).to eq(Ticket)
    end
  end

  describe 'tickets' do
    let(:ticket_reader) { instance_double(TicketReader) }

    before do
      allow(TicketReader).to receive(:new).and_return(ticket_reader)
      allow(ticket_reader).to receive(:read).and_return([:bar])
    end

    subject { described_class.new('a_filename') }

    it 'has the expected items' do
      expect(subject.items).to eq([:bar])
    end

    it 'called the ticket reader as expected' do
      subject
      expect(ticket_reader).to have_received(:read).with('a_filename')
    end
  end

  describe '.tickets_submitted' do
    let(:user) { double(_id: 71) }
    let(:ticket_file) { File.join(File.dirname(__FILE__), 'fixtures', 'tickets.json') }

    subject { described_class.new(ticket_file).tickets_submitted(user) }

    it 'returns three tickets' do
      expect(subject.count).to eq(3)
    end
  end

  describe '.tickets_assigned' do
    let(:user) { double(_id: 71) }
    let(:ticket_file) { File.join(File.dirname(__FILE__), 'fixtures', 'tickets.json') }

    subject { described_class.new(ticket_file).tickets_assigned(user) }

    it 'returns three tickets' do
      expect(subject.count).to eq(1)
    end
  end
end
