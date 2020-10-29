require_relative 'spec_helper'
require_relative '../lib/ticket_reader'

RSpec.describe TicketReader do
  let(:ticket_file) { File.join(File.dirname(__FILE__), 'fixtures', 'tickets.json') }

  subject { described_class.new.read(ticket_file) }

  it 'returns a number of tickets' do
    expect(subject.count).to eq(200)
  end

  context 'bad file name' do
    let(:ticket_file) { File.join(File.dirname(__FILE__), 'fixtures', 'tickets2.json') }

    it 'raises an error' do
      expect { subject }.to raise_error(/No such file or directory/)
    end
  end
end
