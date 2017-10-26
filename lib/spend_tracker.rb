

class SpendTracker
  def initialize(get_purchases: GetPurchasesData.new)
    @get_purchases = get_purchases
    @purchases = []
  end

  def get_purchases_array
    @get_purchases.purchases_data
  end

  def find_purchases(array, id)
    array.select do |purchases_hash|
      purchases_hash["user_id"] == id
    end
  end

  def sum_spent(purchases)
    purchases.map {|purchase| purchase['spend'].to_f}.reduce(0, :+)
  end

  def total_spend(id)
    @purchases = find_purchases(get_purchases_array, id)
    return sum_spent(@purchases)
  end

  def average_spend(id)
    return total_spend(id) / @purchases.count
  end
end
