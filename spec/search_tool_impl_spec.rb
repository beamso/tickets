require_relative '../lib/search_tool_impl'

RSpec.describe SearchToolImpl do
  describe '.initialize' do
    before do
      allow(OrganizationStore).to receive(:new)
      allow(TicketStore).to receive(:new)
      allow(UserStore).to receive(:new)
    end

    subject { described_class.new }

    it 'instantiates the OrganizationStore' do
      expect(OrganizationStore).to receive(:new)
      subject
    end

    it 'instantiates the TicketStore' do
      expect(TicketStore).to receive(:new)
      subject
    end

    it 'instantiates the UserStore' do
      expect(UserStore).to receive(:new)
      subject
    end
  end

  describe '.keys' do
    let(:user_printer) { instance_double(UserPrinter) }

    before do
      allow(instance).to receive(:puts)
      allow(UserPrinter).to receive(:new).and_return(user_printer)
      allow(user_printer).to receive(:print_keys).and_return('foo')
    end

    let(:instance) { described_class.new }
    subject { instance.send(:keys, 'users') }

    it 'calls print_keys' do
      expect(user_printer).to receive(:print_keys)
      subject
    end

    it 'calls puts with foo' do
      expect(instance).to receive(:puts).with('foo')
      subject
    end
  end

  describe '.search' do
    let(:instance) { described_class.new }
    subject { instance.send(:search, 'users', 'foo', 'bar') }

    let(:searcher) { instance_double(Searcher) }
    let(:user) { User.new({}) }
    let(:user_store) { instance_double(UserStore) }
    let(:ticket_store) { instance_double(TicketStore) }
    let(:organization_store) { instance_double(OrganizationStore) }

    before do
      allow(UserStore).to receive(:new).and_return(user_store)
      allow(TicketStore).to receive(:new).and_return(ticket_store)
      allow(ticket_store).to receive(:related_to_user).and_return([])
      allow(OrganizationStore).to receive(:new).and_return(organization_store)
      allow(organization_store).to receive(:related_to_user).and_return([])
      allow(Searcher).to receive(:new).and_return(searcher)
      allow(searcher).to receive(:search).with('foo', 'bar').and_return([user, user])
      allow(instance).to receive(:puts)
      allow(user).to receive(:print)
    end

    it 'instantiates the searcher as expected' do
      expect(Searcher).to receive(:new).with(user_store)
      subject
    end

    it 'calls search on the searcher' do
      expect(searcher).to receive(:search)
      subject
    end

    it 'called print on the user' do
      expect(user).to receive(:print).twice
      subject
    end

    it 'calls puts' do
      expect(instance).to receive(:puts).at_least(3).times
      subject
    end

    it 'calls related_to_user on the TicketStore' do
      expect(ticket_store).to receive(:related_to_user).with(user)
      subject
    end

    it 'calls related_to_user on the OrganizationStore' do
      expect(organization_store).to receive(:related_to_user).with(user)
      subject
    end
  end

  describe '.object_class' do
    subject { described_class.new.send(:object_class, object) }

    context 'users' do
      let(:object) { 'users' }

      it 'returns a User' do
        expect(subject).to eq(User)
      end
    end

    context 'tickets' do
      let(:object) { 'tickets' }

      it 'returns a Ticket' do
        expect(subject).to eq(Ticket)
      end
    end

    context 'organizations' do
      let(:object) { 'organizations' }

      it 'returns a Organization' do
        expect(subject).to eq(Organization)
      end
    end
  end

  describe '.other_stores' do
    let(:organization_store) { instance_double(OrganizationStore) }
    let(:ticket_store) { instance_double(TicketStore) }
    let(:user_store) { instance_double(UserStore) }

    before do
      allow(OrganizationStore).to receive(:new).and_return(organization_store)
      allow(TicketStore).to receive(:new).and_return(ticket_store)
      allow(UserStore).to receive(:new).and_return(user_store)
    end

    subject { described_class.new.send(:other_stores, ticket_store) }

    it 'returns two items' do
      expect(subject.count).to eq(2)
    end

    it 'returns the user store that are not the ticket store' do
      expect(subject).to include(user_store)
    end

    it 'returns the user store that are not the ticket store' do
      expect(subject).to include(organization_store)
    end
  end
end
