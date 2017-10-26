

class SpendTracker
  def initialize(load_purchases: GetPurchasesData.new)
    @load_purchases = load_purchases.purchases_data
    @purchases = []
  end

  def find_purchases(array, id)
    array.select do |purchases_hash|
      purchases_hash["user_id"] == id
    end
  end

  def sum_spent(purchases)
    purchases.map { |purchase| purchase['spend'].to_f }.reduce(0, :+)
  end

  def total_spend(id)
    @purchases = find_purchases(@load_purchases, id)
    p sum_spent(@purchases)
  end

  def average_spend(id)
    return total_spend(id) / @purchases.count
  end
end
