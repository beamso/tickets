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

  describe '.users' do
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
end
