require 'value_tracker'
require 'get_user_data'

describe ValueTracker do
  let(:load_purchases_double) { double :GetPurchasesData }
  let(:user_finder_double) { double :UserFinder }
  subject { described_class.new(purchases: load_purchases_double) }

  before do
    allow(load_purchases_double).to receive(:purchases_data) { purchases_hash_array }
  end

  it 'can display most valuable customer id' do
    expect(subject.find_most_valuable).to eq "1234-2324-GA2D-31RT"
  end
end
