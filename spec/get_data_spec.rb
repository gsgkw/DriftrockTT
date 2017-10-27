require 'get_data'

describe 'getting data' do
  let(:api_double) { double :APICall }
  let(:data_fetcher_double) { double :DataFetcher }

  describe GetUserData do
    let(:subject) { described_class.new(api: api_double, data_fetcher: data_fetcher_double) }
    before do
      allow(data_fetcher_double).to receive(:load_available) { user_hash_array }
    end

    it 'can return array of users' do
      expect(subject.user_data).to eq user_hash_array
    end
  end

  describe GetPurchasesData do
    let(:subject) { described_class.new(api: api_double, data_fetcher: data_fetcher_double) }
    before do
      allow(data_fetcher_double).to receive(:load_available) { purchases_hash_array }
    end

    it 'can return array of purchases' do
      expect(subject.purchases_data).to eq purchases_hash_array
    end
  end

  describe DataFetcher do
    let(:subject) { described_class }
    before do
      allow(api_double).to receive(:get_and_parse) { user_hash_array }
    end
    it 'can return array of hashes' do
      destination = 'users'
      users = []
      api = api_double
      expect(subject.load_available(destination, users, api)).to eq user_hash_array
    end
  end
end
