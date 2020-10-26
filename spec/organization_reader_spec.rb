require_relative 'spec_helper'
require_relative '../lib/organization_reader'

RSpec.describe OrganizationReader do
  let(:organization_file) { File.join(File.dirname(__FILE__), 'fixtures', 'organizations.json') }

  subject { described_class.new.read_organizations(organization_file) }

  it 'returns a number of organizations' do
    expect(subject.count).to eq(25)
  end

  context 'bad file name' do
    let(:organization_file) { File.join(File.dirname(__FILE__), 'fixtures', 'organizations2.json') }

    it 'raises an error' do
      expect { subject }.to raise_error(/No such file or directory/)
    end
  end
end
