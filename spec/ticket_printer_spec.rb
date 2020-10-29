require_relative 'spec_helper'
require_relative '../lib/ticket'
require_relative '../lib/ticket_printer'

RSpec.describe TicketPrinter do
  describe '.print' do
    subject { described_class.new.print(ticket) }

    let(:hash) do
      {
        '_id' => '50dfc8bc-31de-411e-92bf-a6d6b9dfa490',
        'url' => 'http://initech.zendesk.com/api/v2/tickets/50dfc8bc-31de-411e-92bf-a6d6b9dfa490.json',
        'external_id' => '8bc8bee7-2d98-4b69-b4a9-4f348ff41fa3',
        'created_at' => '2016-03-08T09:44:54 -11:00',
        'type' => 'task',
        'subject' => 'A Problem in South Africa',
        'description' => 'Esse nisi occaecat pariatur veniam culpa dolore anim elit aliquip.',
        'priority' => 'high',
        'status' => 'hold',
        'submitter_id' => 43,
        'assignee_id' => 54,
        'organization_id' => 103,
        'tags' => ['Georgia', 'Tennessee', 'Mississippi', 'Marshall Islands'],
        'has_incidents' => true,
        'due_at' => '2016-08-03T09:17:37 -10:00',
        'via' => 'voice'
      }
    end

    let(:ticket) { Ticket.new(hash) }

    let(:expected_output) do
      <<~ENDOFOUTPUT
        _id               50dfc8bc-31de-411e-92bf-a6d6b9dfa490
        url               http://initech.zendesk.com/api/v2/tickets/50dfc8bc-31de-411e-92bf-a6d6b9dfa490.json
        external_id       8bc8bee7-2d98-4b69-b4a9-4f348ff41fa3
        created_at        2016-03-08T09:44:54 -11:00
        type              task
        subject           A Problem in South Africa
        description       Esse nisi occaecat pariatur veniam culpa dolore anim elit aliquip.
        priority          high
        status            hold
        submitter_id      43
        assignee_id       54
        organization_id   103
        tags              ["Georgia", "Tennessee", "Mississippi", "Marshall Islands"]
        has_incidents     true
        due_at            2016-08-03T09:17:37 -10:00
        via               voice
      ENDOFOUTPUT
    end

    it 'returns the expected output' do
      expect(subject).to eq(expected_output)
    end
  end

  describe '.print_keys' do
    subject { described_class.new.print_keys }

    let(:expected_output) do
      <<~ENDOFOUTPUT
        _id
        url
        external_id
        created_at
        type
        subject
        description
        priority
        status
        submitter_id
        assignee_id
        organization_id
        tags
        has_incidents
        due_at
        via
      ENDOFOUTPUT
    end

    it 'returns the expected output' do
      expect(subject).to eq(expected_output)
    end
  end
end
