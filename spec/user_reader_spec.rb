require_relative 'spec_helper'
require_relative '../lib/user_reader'

RSpec.describe UserReader do
  let(:user_file) { File.join(File.dirname(__FILE__), 'fixtures', 'users.json') }

  subject { described_class.new.read_users(user_file) }

  it 'returns a number of users' do
    expect(subject.count).to eq(75)
  end

  context 'bad file name' do
    let(:user_file) { File.join(File.dirname(__FILE__), 'fixtures', 'users2.json') }

    it 'raises an error' do
      expect { subject }.to raise_error(/No such file or directory/)
    end
  end
end
