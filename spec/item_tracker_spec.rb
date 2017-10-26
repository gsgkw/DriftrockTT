require 'item_tracker'

describe ItemTracker do
  let(:load_purchases_double) { double :GetPurchasesData }
  subject { described_class.new(load_purchases: load_purchases_double) }

  before do
    allow(load_purchases_double).to receive(:purchases_data) {
                                      [{ "user_id" => "12DF-2324-GA2D-31RT", "item" => "Huge pineapple pizza", "spend" => "19.99"
                                      }, { "user_id" => "12DF-2324-GA2D-31RT", "item" => "A nice cup of tea", "spend" => "2.99"
                                      }, { "user_id" => "12DF-2324-GA2D-31RT", "item" => "A nice cup of tea", "spend" => "2.99"
                                      }, { "user_id" => "1234-2324-GA2D-31RT", "item" => "Huge pineapple pizza", "spend" => "19.99"
                                      }, { "user_id" => "1234-2324-GA2D-31RT", "item" => "A nice cup of tea", "spend" => "2.99"
                                      }]
                                    }
  end

  it 'can display most frequent item' do
    expect(subject.find_most_frequent).to eq "A nice cup of tea"
  end
end
