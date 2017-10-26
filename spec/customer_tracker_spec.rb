require 'customer_tracker'
require 'get_data'

describe CustomerTracker do
    let(:get_user_double) { double :GetUserData }
    let(:get_purchases_double) { double :GetPurchasesData }
    subject { described_class.new(get_user: get_user_double, get_purchases: get_purchases_double) }


    before do
      allow(get_user_double).to receive(:user_data) {
        [{"id"=>"12DF-2324-GA2D-31RT", "first_name"=>"Drift", "last_name"=>"Rock",
        "phone"=>"0-200-100-1234", "email"=>"drift.rock@email.com"
        }]
      }
      allow(get_purchases_double).to receive(:purchases_data) {
        [ {"user_id"=>"12DF-2324-GA2D-31RT", "item"=>"Huge pineapple pizza", "spend"=>"19.99"
        }, {"user_id"=>"12DF-2324-GA2D-31RT", "item"=>"A nice cup of tea", "spend"=>"2.99"
        }, {"user_id"=>"12DF-2324-GA2D-31RT", "item"=>"A nice cup of tea", "spend"=>"2.99"
        } ]
        }
    end


    it 'can return user id from email' do
      expect(subject.find_user_id("drift.rock@email.com")).to eq "12DF-2324-GA2D-31RT"
    end

    it 'can display customer total spend' do
      expect(subject.total_spend [EMAIL]).to eq 19.99+2.99
    end

    it 'can display customer average spend' do
      expect(subject.average_spend [EMAIL]).to eq (19.99+2.99)/2
    end

    it 'can display email of customer with most purchases' do
      expect(subject.most_loyal).to eq EMAIL
    end

    it 'can display most sold item' do
      expect(subject.most_sold).to eq "A nice cup of tea"
    end
end
