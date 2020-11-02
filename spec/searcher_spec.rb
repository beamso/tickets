# coding: utf-8

require_relative 'spec_helper'
require_relative '../lib/searcher'
require_relative '../lib/user_store'

RSpec.describe Searcher do
  subject { described_class.new(store).search(key, value) }

  context 'a user store' do
    let(:filename) { File.join(File.dirname(__FILE__), 'fixtures', 'users.json') }
    let(:store) { UserStore.new(filename) }

    context 'string value' do
      let(:key) { 'locale' }
      let(:value) { 'zh-CN' }

      it 'returns the expected number of users' do
        expect(subject.count).to eq(27)
      end
    end

    context 'boolean value' do
      let(:key) { 'active' }
      let(:value) { 'true' }

      it 'returns the expected number of users' do
        expect(subject.count).to eq(39)
      end
    end

    context 'integer value' do
      let(:key) { 'organization_id' }
      let(:value) { '122' }

      it 'returns the expected number of users' do
        expect(subject.count).to eq(4)
      end
    end

    context 'array member' do
      let(:key) { 'tags' }
      let(:value) { 'Strong' }

      it 'returns the expected number of users' do
        expect(subject.count).to eq(1)
      end
    end

    context 'value not found' do
      let(:key) { 'locale' }
      let(:value) { 'de-DE' }

      it 'returns the expected number of users' do
        expect(subject.count).to eq(0)
      end
    end

    context 'key not found' do
      let(:key) { 'foo' }
      let(:value) { 'bar' }

      it 'raises an error' do
        expect { subject }.to raise_error(/No key/)
      end
    end

    context 'value nil' do
      let(:key) { 'verified' }
      let(:value) { '' }

      it 'returns the expected number of users' do
        expect(subject.count).to eq(2)
      end
    end
  end

  context 'an organization store' do
    let(:filename) { File.join(File.dirname(__FILE__), 'fixtures', 'organizations.json') }
    let(:store) { OrganizationStore.new(filename) }

    context 'string value' do
      let(:key) { 'details' }
      let(:value) { 'MegaCörp' }

      it 'returns the expected number of organizations' do
        expect(subject.count).to eq(3)
      end
    end

    context 'boolean value' do
      let(:key) { 'shared_tickets' }
      let(:value) { 'false' }

      it 'returns the expected number of organizations' do
        expect(subject.count).to eq(15)
      end
    end
  end
end
