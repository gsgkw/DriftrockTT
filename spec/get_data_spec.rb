require 'get_data'

describe GetUserData do
  let(:data_fetcher_double) { double :DataFetcher }
  let(:api_double) { double :APICall }
  let(:subject) { described_class.new(api: api_double, data_fetcher: data_fetcher_double) }
  before do
    allow(data_fetcher_double).to receive(:load_available) {
      [{ "id" => "12DF-2324-GA2D-31RT", "first_name" => "Drift", "last_name" => "Rock",
      "phone" => "0-200-100-1234", "email" => "drift.rock@email.com"
      }, { "id" => "1234-2324-GA2D-31RT", "first_name" => "Drit", "last_name" => "Rocc",
      "phone" => "0-999-999-1234", "email" => "drit.rocc@email.com"
      }]
    }
  end

  it 'can return array of users' do
    expect(subject.user_data).to eq [{ "id" => "12DF-2324-GA2D-31RT", "first_name" => "Drift", "last_name" => "Rock",
    "phone" => "0-200-100-1234", "email" => "drift.rock@email.com"
    }, { "id" => "1234-2324-GA2D-31RT", "first_name" => "Drit", "last_name" => "Rocc",
    "phone" => "0-999-999-1234", "email" => "drit.rocc@email.com"
    }]
  end
end

describe GetPurchasesData do
  let(:data_fetcher_double) { double :DataFetcher }
  let(:api_double) { double :APICall }
  let(:subject) { described_class.new(api: api_double, data_fetcher: data_fetcher_double) }
  before do
    allow(data_fetcher_double).to receive(:load_available) {
                                    [{ "user_id" => "12DF-2324-GA2D-31RT", "item" => "Huge pineapple pizza", "spend" => "19.99"
                                    }, { "user_id" => "12DF-2324-GA2D-31RT", "item" => "A nice cup of tea", "spend" => "2.99"
                                    }, { "user_id" => "12DF-2324-GA2D-31RT", "item" => "A nice cup of tea", "spend" => "2.99"
                                    }, { "user_id" => "1234-2324-GA2D-31RT", "item" => "Huge pineapple pizza", "spend" => "19.99"
                                    }, { "user_id" => "1234-2324-GA2D-31RT", "item" => "A nice cup of tea", "spend" => "2.99"
                                    }]
                                  }
  end

  it 'can return array of purchases' do
    expect(subject.purchases_data).to eq [{ "user_id" => "12DF-2324-GA2D-31RT", "item" => "Huge pineapple pizza", "spend" => "19.99"
    }, { "user_id" => "12DF-2324-GA2D-31RT", "item" => "A nice cup of tea", "spend" => "2.99"
    }, { "user_id" => "12DF-2324-GA2D-31RT", "item" => "A nice cup of tea", "spend" => "2.99"
    }, { "user_id" => "1234-2324-GA2D-31RT", "item" => "Huge pineapple pizza", "spend" => "19.99"
    }, { "user_id" => "1234-2324-GA2D-31RT", "item" => "A nice cup of tea", "spend" => "2.99"
    }]
  end
end

describe DataFetcher do
  let(:subject) { described_class }
  let(:api_double) { double :APICall }
  before do
    allow(api_double).to receive(:get_and_parse) {
                           [{ "id" => "12DF-2324-GA2D-31RT", "first_name" => "Drift", "last_name" => "Rock",
                         "phone" => "0-200-100-1234", "email" => "drift.rock@email.com"
                         }]
                         }
  end
  it 'can return array of hashes' do
    destination = 'users'
    users = []
    api = api_double
    expect(subject.load_available(destination, users, api)).to eq([{ "id" => "12DF-2324-GA2D-31RT", "first_name" => "Drift", "last_name" => "Rock",
  "phone" => "0-200-100-1234", "email" => "drift.rock@email.com"
  }])
  end
end
