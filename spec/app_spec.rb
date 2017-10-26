require 'app'

describe CustomerTracker do
    let :subject {described_class}
    
    it 'can return user id from email' do
      expect(subject.find_user_id [EMAIL]).to eq "12DF-2324-GA2D-31RT"
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
