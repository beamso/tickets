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

  describe 'organizations' do
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
end
