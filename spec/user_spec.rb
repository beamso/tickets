require_relative 'spec_helper'
require_relative '../lib/user'

RSpec.describe User do
  let(:hash) do
    {
      '_id' => 1,
      'url' => 'http://initech.zendesk.com/api/v2/users/1.json',
      'external_id' => '74341f74-9c79-49d5-9611-87ef9b6eb75f',
      'name' => 'Francisca Rasmussen',
      'alias' => 'Miss Coffey',
      'created_at' => '2016-04-15T05:19:46 -10:00',
      'active' => true,
      'verified' => true,
      'shared' => false,
      'locale' => 'en-AU',
      'timezone' => 'Sri Lanka',
      'last_login_at' => '2013-08-04T01:03:27 -10:00',
      'email' => 'coffeyrasmussen@flotonic.com',
      'phone' => '8335-422-718',
      'signature' => 'Don\'t Worry Be Happy!',
      'organization_id' => 119,
      'tags' => ['Springville', 'Sutton', 'Hartsville/Hartley', 'Diaperville'],
      'suspended' => true,
      'role' => 'admin'
    }
  end

  subject { described_class.new(hash) }

  it 'has the expected keys' do
    expect(described_class.keys).to eq(%w[_id url external_id name alias created_at active verified shared locale
                                          timezone last_login_at email phone signature organization_id tags suspended
                                          role])
  end

  it 'has the expected _id' do
    expect(subject._id).to eq(1)
  end

  it 'has the expected url' do
    expect(subject.url).to eq('http://initech.zendesk.com/api/v2/users/1.json')
  end

  it 'has the expected external_id' do
    expect(subject.external_id).to eq('74341f74-9c79-49d5-9611-87ef9b6eb75f')
  end

  it 'has the expected name' do
    expect(subject.name).to eq('Francisca Rasmussen')
  end

  it 'has the expected alias' do
    expect(subject.alias).to eq('Miss Coffey')
  end

  it 'has the expected created_at' do
    expect(subject.created_at).to eq('2016-04-15T05:19:46 -10:00')
  end

  it 'has the expected active' do
    expect(subject.active).to eq(true)
  end

  it 'has the expected verified' do
    expect(subject.verified).to eq(true)
  end

  it 'has the expected shared' do
    expect(subject.shared).to eq(false)
  end

  it 'has the expected locale' do
    expect(subject.locale).to eq('en-AU')
  end

  it 'has the expected timezone' do
    expect(subject.timezone).to eq('Sri Lanka')
  end

  it 'has the expected last_login_at' do
    expect(subject.last_login_at).to eq('2013-08-04T01:03:27 -10:00')
  end

  it 'has the expeected email' do
    expect(subject.email).to eq('coffeyrasmussen@flotonic.com')
  end

  it 'has the expected phone' do
    expect(subject.phone).to eq('8335-422-718')
  end

  it 'has the expected signature' do
    expect(subject.signature).to eq('Don\'t Worry Be Happy!')
  end

  it 'has the expected organization_id' do
    expect(subject.organization_id).to eq(119)
  end

  it 'has the expected tags' do
    expect(subject.tags).to eq(['Springville', 'Sutton', 'Hartsville/Hartley', 'Diaperville'])
  end

  it 'has the expected suspended' do
    expect(subject.suspended).to eq(true)
  end

  it 'has the expected role' do
    expect(subject.role).to eq('admin')
  end

  describe '.print' do
    let(:user_printer) { instance_double(UserPrinter) }

    before do
      allow(UserPrinter).to receive(:new).and_return(user_printer)
      allow(user_printer).to receive(:print).and_return('bar')
    end

    let(:instance) { User.new({}) }

    subject { instance.print }

    it 'returns the expected output' do
      expect(subject).to eq('bar')
    end

    it 'calls print on the printer' do
      expect(user_printer).to receive(:print).with(instance)
      subject
    end
  end

  describe '.print_keys' do
    let(:user_printer) { instance_double(UserPrinter) }

    before do
      allow(UserPrinter).to receive(:new).and_return(user_printer)
      allow(user_printer).to receive(:print_keys).and_return('bar')
    end

    subject { described_class.print_keys }

    it 'returns the expected output' do
      expect(subject).to eq('bar')
    end

    it 'calls print on the printer' do
      expect(user_printer).to receive(:print_keys)
      subject
    end
  end

  describe '.print_short' do
    subject { described_class.new(hash).print_short }

    it 'returns the expected output' do
      expect(subject).to eq('User  Francisca Rasmussen')
    end
  end
end
