require 'spend_tracker'
require 'get_user_data'

describe SpendTracker do
  let(:load_purchases_double) { double :GetPurchasesData }
  subject { described_class.new(load_purchases: load_purchases_double) }
  let(:id) { "12DF-2324-GA2D-31RT" }

  before do
    allow(load_purchases_double).to receive(:purchases_data) { purchases_hash_array }
  end

  it 'can display customer total spend' do
    expect(subject.total_spend(id)).to eq(19.99 + 2.99 + 2.99)
  end

  it 'can display customer average spend' do
    expect(subject.average_spend(id)).to eq((19.99 + 2.99 + 2.99) / 3)
  end

end
