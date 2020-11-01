require_relative 'spec_helper'
require_relative '../lib/user_store'

RSpec.describe UserStore do
  describe '.instance_class' do
    let(:user_reader) { instance_double(UserReader) }

    before do
      allow(UserReader).to receive(:new).and_return(user_reader)
      allow(user_reader).to receive(:read).and_return([:baz])
    end

    subject { described_class.new('a_filename').instance_class }

    it 'returns the expected class' do
      expect(subject).to eq(User)
    end
  end

  describe '.items' do
    let(:user_reader) { instance_double(UserReader) }

    before do
      allow(UserReader).to receive(:new).and_return(user_reader)
      allow(user_reader).to receive(:read).and_return([:baz])
    end

    subject { described_class.new('a_filename') }

    it 'has the expected items' do
      expect(subject.items).to eq([:baz])
    end

    it 'called the user reader as expected' do
      subject
      expect(user_reader).to have_received(:read).with('a_filename')
    end
  end

  describe '.related_to_user' do
    let(:user_reader) { instance_double(UserReader) }

    before do
      allow(UserReader).to receive(:new).and_return(user_reader)
      allow(user_reader).to receive(:read).and_return([:baz])
    end

    subject { described_class.new('a_filename').related_to_user(nil) }

    it 'returns an empty list' do
      expect(subject).to eq([])
    end
  end

  describe '.related_to_ticket' do
    let(:ticket) { double(submitter_id: 25, assignee_id: 64) }
  end

  describe '.related_to_organization' do
    let(:organization) { double(_id: 114) }
    let(:ticket_file) { File.join(File.dirname(__FILE__), 'fixtures', 'users.json') }

    subject { described_class.new(ticket_file).related_to_organization(organization) }

    it 'returns 5 users' do
      expect(subject.count).to eq(5)
    end
  end
end
