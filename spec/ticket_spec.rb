require_relative 'spec_helper'
require_relative '../lib/ticket'

RSpec.describe Ticket do
  let(:hash) do
    {
      '_id' => '436bf9b0-1147-4c0a-8439-6f79833bff5b',
      'url' => 'http://initech.zendesk.com/api/v2/tickets/436bf9b0-1147-4c0a-8439-6f79833bff5b.json',
      'external_id' => '9210cdc9-4bee-485f-a078-35396cd74063',
      'created_at' => '2016-04-28T11:19:34 -10:00',
      'type' => 'incident',
      'subject' => 'A Catastrophe in Korea (North)',
      'description' => 'Nostrud ad sit velit cupidatat laboris ipsum nisi amet laboris ex exercitation amet et '\
                       'proident. Ipsum fugiat aute dolore tempor nostrud velit ipsum.',
      'priority' => 'high',
      'status' => 'pending',
      'submitter_id' => 38,
      'assignee_id' => 24,
      'organization_id' => 116,
      'tags' => ['Ohio', 'Pennsylvania', 'American Samoa', 'Northern Mariana Islands'],
      'has_incidents' => false,
      'due_at' => '2016-07-31T02:37:50 -10:00',
      'via' => 'web'
    }
  end

  subject { described_class.new(hash) }

  it 'has the expected keys' do
    expect(described_class.keys).to eq(%w[_id url external_id created_at type subject description priority status
                                          submitter_id assignee_id organization_id tags has_incidents due_at via])
  end

  it 'has the expected _id' do
    expect(subject._id).to eq('436bf9b0-1147-4c0a-8439-6f79833bff5b')
  end

  it 'has the expected url' do
    expect(subject.url).to eq('http://initech.zendesk.com/api/v2/tickets/436bf9b0-1147-4c0a-8439-6f79833bff5b.json')
  end

  it 'has the expected external_id' do
    expect(subject.external_id).to eq('9210cdc9-4bee-485f-a078-35396cd74063')
  end

  it 'has the expected created_at' do
    expect(subject.created_at).to eq('2016-04-28T11:19:34 -10:00')
  end

  it 'has the expected type' do
    expect(subject.type).to eq('incident')
  end

  it 'has the expected subject' do
    expect(subject.subject).to eq('A Catastrophe in Korea (North)')
  end

  it 'has the expected description' do
    expect(subject.description).to eq('Nostrud ad sit velit cupidatat laboris ipsum nisi amet laboris ex exercitation '\
                                      'amet et proident. Ipsum fugiat aute dolore tempor nostrud velit ipsum.')
  end

  it 'has the expected priority' do
    expect(subject.priority).to eq('high')
  end

  it 'has the expected status' do
    expect(subject.status).to eq('pending')
  end

  it 'has the expected submitter_id' do
    expect(subject.submitter_id).to eq(38)
  end

  it 'has the expected assignee_id' do
    expect(subject.assignee_id).to eq(24)
  end

  it 'has the expected organization_id' do
    expect(subject.organization_id).to eq(116)
  end

  it 'has the expected tags' do
    expect(subject.tags).to eq(['Ohio', 'Pennsylvania', 'American Samoa', 'Northern Mariana Islands'])
  end

  it 'has the expected has_incidents' do
    expect(subject.has_incidents).to eq(false)
  end

  it 'has the expected due_at' do
    expect(subject.due_at).to eq('2016-07-31T02:37:50 -10:00')
  end

  it 'has the expected via' do
    expect(subject.via).to eq('web')
  end
end
