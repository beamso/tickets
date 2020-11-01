require_relative 'spec_helper'
require_relative '../lib/object_printer'
require_relative '../lib/user'

RSpec.describe ObjectPrinter do
  let(:instance) { described_class.new(User) }
  let(:users) { [User.new('_id' => 1), User.new('_id' => 2)] }

  describe '.print_short' do
    subject { instance.print_short(users) }

    it 'returns the expected text' do
      expect(subject).to eq('User ids: [1, 2]')
    end

    context 'with an empty array' do
      let(:users) { [] }

      it 'returns the expected text' do
        expect(subject).to eq('')
      end
    end
  end
end
