require 'value_tracker'
require 'get_data'

describe ValueTracker do
  let(:load_purchases_double) { double :GetPurchasesData }
  subject { described_class.new(load_purchases: load_purchases_double) }

  before do
    allow(load_purchases_double).to receive(:purchases_data) {
                                      [{ "user_id" => "12DF-2324-GA2D-31RT", "item" => "Huge pineapple pizza", "spend" => "19.99"
                                      }, { "user_id" => "12DF-2324-GA2D-31RT", "item" => "A nice cup of tea", "spend" => "2.99"
                                      }, { "user_id" => "12DF-2324-GA2D-31RT", "item" => "A nice cup of tea", "spend" => "2.99"
                                      }, { "user_id" => "1234-2324-GA2D-31RT", "item" => "Huge pineapple pizza", "spend" => "99.99"
                                      }, { "user_id" => "1234-2324-GA2D-31RT", "item" => "A nice cup of tea", "spend" => "2.99"
                                      }]
                                    }
  end

  it 'can display most valuable customer id' do
    expect(subject.find_most_user_id).to eq "1234-2324-GA2D-31RT"
  end
end
