

class ValueTracker
  def initialize(purchases: GetPurchasesData.new)
    @purchases = purchases.purchases_data
  end

  def return_most_valuable_id(hash)
    hash.sort_by { |_key, value| value }.reverse.first[0]
  end

  def find_most_valuable
    values = Hash.new(0)
    @purchases.each { |hash| values[hash["user_id"]] += hash["spend"].to_f }
    return return_most_valuable_id(values)
  end
end
