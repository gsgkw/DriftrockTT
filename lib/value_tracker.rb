class ValueTracker
  def initialize(load_purchases: GetPurchasesData.new, find_email: EmailFinder.new)
    @load_purchases = load_purchases.purchases_data
    @purchases = []
    @find_email = find_email
  end

  def return_most_valuable_key(hash)
    hash.sort_by { |_k, v| v }.reverse.first[0]
  end

  def find_most_valuable
    p id = find_most_user_id
    @find_email.find_email(id)
  end

  def find_most_user_id
    value_hash = Hash.new(0)
    @load_purchases.each { |hash| value_hash[hash["user_id"]] += hash["spend"].to_f }
    return return_most_valuable_key(value_hash)
  end
end
