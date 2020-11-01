require_relative 'spec_helper'
require_relative '../lib/organization_store'

RSpec.describe OrganizationStore do
  describe '.instance_class' do
    let(:organization_reader) { instance_double(OrganizationReader) }

    before do
      allow(OrganizationReader).to receive(:new).and_return(organization_reader)
      allow(organization_reader).to receive(:read).and_return([:foo])
    end

    subject { described_class.new('a_filename').instance_class }

    it 'returns the expected class' do
      expect(subject).to eq(Organization)
    end
  end

  describe '.items' do
    let(:organization_reader) { instance_double(OrganizationReader) }

    before do
      allow(OrganizationReader).to receive(:new).and_return(organization_reader)
      allow(organization_reader).to receive(:read).and_return([:foo])
    end

    subject { described_class.new('a_filename') }

    it 'has the expected items' do
      expect(subject.items).to eq([:foo])
    end

    it 'called the organization reader as expected' do
      subject
      expect(organization_reader).to have_received(:read).with('a_filename')
    end
  end

  describe '.related_to_ticket' do
    let(:ticket) { double(organization_id: 121) }

    let(:organization_file) { File.join(File.dirname(__FILE__), 'fixtures', 'organizations.json') }

    subject { described_class.new(organization_file).related_to_ticket(ticket) }

    it 'returns 1 organization' do
      expect(subject.count).to eq(1)
    end

    it 'has the expected organization_id' do
      expect(subject.map(&:_id)).to all(eq(121))
    end
  end

  describe '.related_to_user' do
    let(:user) { double(organization_id: 121) }

    let(:organization_file) { File.join(File.dirname(__FILE__), 'fixtures', 'organizations.json') }

    subject { described_class.new(organization_file).related_to_user(user) }

    it 'returns 1 organization' do
      expect(subject.count).to eq(1)
    end

    it 'has the expected organization_id' do
      expect(subject.map(&:_id)).to all(eq(121))
    end
  end

  describe '.related_to_organization' do
    let(:organization_file) { File.join(File.dirname(__FILE__), 'fixtures', 'organizations.json') }

    subject { described_class.new(organization_file).related_to_organization(nil) }

    it 'return an empty list' do
      expect(subject).to eq([])
    end
  end
end
