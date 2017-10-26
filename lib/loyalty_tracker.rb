class LoyaltyTracker
  def initialize(load_purchases: GetPurchasesData.new)
    @load_purchases = load_purchases.purchases_data
    @purchases = []
  end

  def find_most_frequent
    freq = Hash.new(0)
    @load_purchases.each { |hash| freq[hash["user_id"]] += 1 }
    freq.keys.group_by { |e| e }.max_by{|_,v| v.size}.first
  end

end
