class SpendTracker
  def initialize(load_purchases: DataFetcher.new)
    @purchase_data = load_purchases.get_purchases
    @user_purchases = []
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
    @user_purchases = find_purchases(@purchase_data, id)
    sum_spent(@user_purchases)
  end

  def average_spend(id)
    return total_spend(id) / @user_purchases.count
  end
end
