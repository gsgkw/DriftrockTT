

class ValueTracker
  def initialize(purchases: GetPurchasesData.new, find_email: UserFinder.new)
    @purchases = purchases.purchases_data
    @find_email = find_email
  end

  def return_most_valuable_key(hash)
    hash.sort_by { |_k, v| v }.reverse.first[0]
  end

  def find_most_valuable
    p id = find_most_user_id
    @find_email.find_info("email", id)
  end

  def find_most_user_id
    values = Hash.new(0)
    @purchases.each { |hash| values[hash["user_id"]] += hash["spend"].to_f }
    return return_most_valuable_key(values)
  end
end
