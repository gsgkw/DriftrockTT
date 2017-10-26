class LoyaltyTracker
  def initialize(load_purchases: GetPurchasesData.new)
    @load_purchases = load_purchases.purchases_data
    @purchases = []
  end

  def return_most_frequent_key(hash)
    hash.keys.group_by { |e| e }.max_by { |_, v| v.size }.first
  end

  def find_most_frequent
    freq = Hash.new(0)
    @load_purchases.each { |hash| freq[hash["user_id"]] += 1 }
    return_most_frequent_key(freq)
  end

end
