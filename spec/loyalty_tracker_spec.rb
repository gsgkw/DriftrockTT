require 'loyalty_tracker'
require 'get_data'

describe LoyaltyTracker do
  let(:load_purchases_double) { double :GetPurchasesData }
  subject { described_class.new(load_purchases: load_purchases_double) }

  before do
    allow(load_purchases_double).to receive(:purchases_data) { purchases_hash_array }
  end

  it 'can display most frequent customer' do
    expect(subject.find_most_frequent).to eq "12DF-2324-GA2D-31RT"
  end
end
