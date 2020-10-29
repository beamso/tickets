# coding: utf-8

require_relative 'spec_helper'
require_relative '../lib/organization'
require_relative '../lib/organization_printer'

RSpec.describe OrganizationPrinter do
  describe '.print' do
    let(:hash) do
      {
        '_id' => 125,
        'url' => 'http://initech.zendesk.com/api/v2/organizations/125.json',
        'external_id' => '42a1a845-70cf-40ed-a762-acb27fd606cc',
        'name' => 'Strezzö',
        'domain_names' => ['techtrix.com', 'teraprene.com', 'corpulse.com', 'flotonic.com'],
        'created_at' => '2016-02-21T06:11:51 -11:00',
        'details' => 'MegaCorp',
        'shared_tickets' => false,
        'tags' => ['Vance', 'Ray', 'Jacobs', 'Frank']
      }
    end

    let(:organization) { Organization.new(hash) }

    subject { described_class.new.print(organization) }

    let(:expected_output) do
      <<~ENDOFOUTPUT
        _id              125
        url              http://initech.zendesk.com/api/v2/organizations/125.json
        external_id      42a1a845-70cf-40ed-a762-acb27fd606cc
        name             Strezzö
        domain_names     ["techtrix.com", "teraprene.com", "corpulse.com", "flotonic.com"]
        created_at       2016-02-21T06:11:51 -11:00
        details          MegaCorp
        shared_tickets   false
        tags             ["Vance", "Ray", "Jacobs", "Frank"]
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
        name
        domain_names
        created_at
        details
        shared_tickets
        tags
      ENDOFOUTPUT
    end

    it 'returns the expected output' do
      expect(subject).to eq(expected_output)
    end
  end
end
