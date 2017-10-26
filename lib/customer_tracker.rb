

class CustomerTracker

  def initialize(get_user: GetUserData.new, get_purchases: GetPurchasesData)
    @get_user = get_user
    @get_purchases = get_purchases
  end

  def find_user_id(email)
    users_array = @get_user.user_data
    user = users_array.find do |user_hash|
      user_hash["email"] == email
    end
    p user["id"]

    return user["id"]

  end

  def total_spend(_email)
  end

  def average_spend(_email)
  end

  def most_loyal
  end

  def most_sold
  end

end
