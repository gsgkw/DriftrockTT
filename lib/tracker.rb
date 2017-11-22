class Tracker
  def initialize(load_purchases: GetPurchasesData.new)
    @load_purchases = load_purchases.purchases_data
    @purchases = []
    @user_key = "user_id"
    @item_key = "item"
  end

  def return_most_frequent_key(hash)
    hash.sort_by { |_key, value| value }.reverse.first[0]
  end

  def find_frequency(key)
    freq = Hash.new(0)
    @load_purchases.each { |hash| freq[hash[key]] += 1 }
    return_most_frequent_key(freq)
  end

  def find_most_loyal
    def find_frequency(@user_key)
  end

  def find_most_sold
    def find_frequency(@item_key)
  end

end
