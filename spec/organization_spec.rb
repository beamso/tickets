require_relative 'spec_helper'
require_relative '../lib/organization'

RSpec.describe Organization do
  let(:hash) do
    {
      '_id' => 101,
      'url' => 'http://initech.zendesk.com/api/v2/organizations/101.json',
      'external_id' => '9270ed79-35eb-4a38-a46f-35725197ea8d',
      'name' => 'Enthaze',
      'domain_names' => ['kage.com', 'ecratic.com', 'endipin.com', 'zentix.com'],
      'created_at' => '2016-05-21T11:10:28 -10:00',
      'details' => 'MegaCorp',
      'shared_tickets' => false,
      'tags' => ['Fulton', 'West', 'Rodriguez', 'Farley']
    }
  end

  subject { described_class.new(hash) }

  it 'has the expected keys' do
    expect(described_class.keys).to eq(%w[_id url external_id name domain_names created_at details shared_tickets tags])
  end

  it 'has the expected _id' do
    expect(subject._id).to eq(101)
  end

  it 'has the expected url' do
    expect(subject.url).to eq('http://initech.zendesk.com/api/v2/organizations/101.json')
  end

  it 'has the expected external_id' do
    expect(subject.external_id).to eq('9270ed79-35eb-4a38-a46f-35725197ea8d')
  end

  it 'has the expected name' do
    expect(subject.name).to eq('Enthaze')
  end

  it 'has the expected domain_names' do
    expect(subject.domain_names).to eq(['kage.com', 'ecratic.com', 'endipin.com', 'zentix.com'])
  end

  it 'has the expected created_at' do
    expect(subject.created_at).to eq('2016-05-21T11:10:28 -10:00')
  end

  it 'has the expected details' do
    expect(subject.details).to eq('MegaCorp')
  end

  it 'has the expected shared_tickets' do
    expect(subject.shared_tickets).to eq(false)
  end

  it 'has the expected tags' do
    expect(subject.tags).to eq(%w[Fulton West Rodriguez Farley])
  end
end
