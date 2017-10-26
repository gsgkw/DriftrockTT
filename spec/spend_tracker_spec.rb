require 'spend_tracker'
require 'get_data'

describe SpendTracker do
  let(:load_purchases_double) { double :GetPurchasesData }
  subject { described_class.new(load_purchases: load_purchases_double) }
  let(:id) { "12DF-2324-GA2D-31RT" }

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

  it 'can display customer total spend' do
    expect(subject.total_spend(id)).to eq(19.99 + 2.99 + 2.99)
  end

  it 'can display customer average spend' do
    expect(subject.average_spend(id)).to eq((19.99 + 2.99 + 2.99) / 3)
  end

    # it 'can display email of customer with most purchases' do
    #   expect(subject.most_loyal).to eq email
    # end
    #
    # it 'can display most sold item' do
    #   expect(subject.most_sold).to eq "A nice cup of tea"
    # end
end
