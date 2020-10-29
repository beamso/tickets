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
    let(:user_printer) { instance_double(UserPrinter) }
    let(:user_store) { instance_double(UserStore) }

    before do
      allow(UserStore).to receive(:new).and_return(user_store)
      allow(Searcher).to receive(:new).and_return(searcher)
      allow(searcher).to receive(:search).with('foo', 'bar').and_return([user, user])
      allow(UserPrinter).to receive(:new).and_return(user_printer)
      allow(user_printer).to receive(:print).and_return('baz')
      allow(instance).to receive(:puts)
    end

    it 'instantiates the searcher as expected' do
      expect(Searcher).to receive(:new).with(user_store)
      subject
    end

    it 'calls search on the searcher' do
      expect(searcher).to receive(:search)
      subject
    end

    it 'called print on the printer' do
      expect(user_printer).to receive(:print).twice
      subject
    end

    it 'calls puts' do
      expect(instance).to receive(:puts).with('baz').twice
      subject
    end
  end

  describe '.printer_class' do
    subject { described_class.new.send(:printer_class, object) }

    context 'users' do
      let(:object) { 'users' }

      it 'returns a UserPrinter' do
        expect(subject).to eq(UserPrinter)
      end
    end

    context 'tickets' do
      let(:object) { 'tickets' }

      it 'returns a TicketPrinter' do
        expect(subject).to eq(TicketPrinter)
      end
    end

    context 'organizations' do
      let(:object) { 'organizations' }

      it 'returns a OrganizationPrinter' do
        expect(subject).to eq(OrganizationPrinter)
      end
    end
  end
end
