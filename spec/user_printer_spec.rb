require_relative 'spec_helper'
require_relative '../lib/user'
require_relative '../lib/user_printer'

RSpec.describe UserPrinter do
  describe '.print' do
    let(:hash) do
      {
        '_id' => 75,
        'url' => 'http://initech.zendesk.com/api/v2/users/75.json',
        'external_id' => '0db0c1da-8901-4dc3-a469-fe4b500d0fca',
        'name' => 'Catalina Simpson',
        'alias' => 'Miss Rosanna',
        'created_at' => '2016-06-07T09:18:00 -10:00',
        'active' => false,
        'verified' => true,
        'shared' => true,
        'locale' => 'zh-CN',
        'timezone' => 'US Minor Outlying Islands',
        'last_login_at' => '2012-10-15T12:36:41 -11:00',
        'email' => 'rosannasimpson@flotonic.com',
        'phone' => '8615-883-099',
        'signature' => 'Don\'t Worry Be Happy!',
        'organization_id' => 119,
        'tags' => ['Veguita', 'Navarre', 'Elizaville', 'Beaulieu'],
        'suspended' => true,
        'role' => 'agent'
      }
    end

    let(:user) { User.new(hash) }

    subject { described_class.new.print(user) }

    let(:expected_output) do
      <<~ENDOFOUTPUT
        _id               75
        url               http://initech.zendesk.com/api/v2/users/75.json
        external_id       0db0c1da-8901-4dc3-a469-fe4b500d0fca
        name              Catalina Simpson
        alias             Miss Rosanna
        created_at        2016-06-07T09:18:00 -10:00
        active            false
        verified          true
        shared            true
        locale            zh-CN
        timezone          US Minor Outlying Islands
        last_login_at     2012-10-15T12:36:41 -11:00
        email             rosannasimpson@flotonic.com
        phone             8615-883-099
        signature         Don't Worry Be Happy!
        organization_id   119
        tags              ["Veguita", "Navarre", "Elizaville", "Beaulieu"]
        suspended         true
        role              agent
      ENDOFOUTPUT
    end

    it 'returns the expected output' do
      expect(subject).to eq(expected_output)
    end
  end

  describe '.print_keys' do
    subject { described_class.new.print_keys }

    let(:expected_output) do
      <<~ENDOFOUTPUT
        _id
        url
        external_id
        name
        alias
        created_at
        active
        verified
        shared
        locale
        timezone
        last_login_at
        email
        phone
        signature
        organization_id
        tags
        suspended
        role
      ENDOFOUTPUT
    end

    it 'returns the expected output' do
      expect(subject).to eq(expected_output)
    end
  end
end
