require 'get_purchases_data'

describe GetPurchasesData do
  let(:data_fetcher_double) { double :DataFetcher }
  let(:api_double) { double :APICall }
  let(:subject) { described_class.new(api: api_double, data_fetcher: data_fetcher_double) }
  before do
    allow(data_fetcher_double).to receive(:load_available) { purchases_hash_array }
  end

  it 'can return array of purchases' do
    expect(subject.purchases_data).to eq purchases_hash_array
  end
end
