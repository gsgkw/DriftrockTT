require 'item_tracker'

describe ItemTracker do
  let(:load_purchases_double) { double :GetPurchasesData }
  subject { described_class.new(load_purchases: load_purchases_double) }

  before do
    allow(load_purchases_double).to receive(:purchases_data) { purchases_hash_array }
  end

  it 'can display most frequent item' do
    expect(subject.find_most_frequent).to eq "A nice cup of tea"
  end
end
