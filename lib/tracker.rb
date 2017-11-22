class Tracker
  def initialize(load_purchases: GetPurchasesData.new)
    @load_purchases = load_purchases.purchases_data
    @purchases = []
  end

  def return_most_frequent_key(hash)
    hash.sort_by { |_key, value| value }.reverse.first[0]
  end

  def find_most_loyal
    freq = Hash.new(0)
    @load_purchases.each { |hash| freq[hash["user_id"]] += 1 }
    return_most_frequent_key(freq)
  end

  def find_most_popular
    freq = Hash.new(0)
    @load_purchases.each { |hash| freq[hash["item"]] += 1 }
    return_most_frequent_key(freq)
  end

end
