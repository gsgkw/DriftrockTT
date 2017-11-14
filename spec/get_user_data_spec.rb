require 'get_user_data'

describe GetUserData do
  let(:api_double) { double :APICall }
  let(:data_fetcher_double) { double :DataFetcher }
  let(:subject) { described_class.new(api: api_double, data_fetcher: data_fetcher_double) }
  before do
    allow(data_fetcher_double).to receive(:load_available) { user_hash_array }
  end

  it 'can return array of users' do
    expect(subject.user_data).to eq user_hash_array
  end
end
