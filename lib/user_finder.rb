

class UserFinder

  def initialize(get_user: GetUserData.new)
    @get_user = get_user
  end

  def find_user(array, email)
    array.find do |user_hash|
      user_hash["email"] == email
    end
  end

  def get_users_array
    @get_user.user_data
  end

  def find_user_id(email)
    users_array = get_users_array
    user = find_user(users_array, email)
    p user["id"]
    return user["id"]
  end
end

class UserComparer
  def most_loyal
  end
end

class PurchasesTracker
  def most_sold
  end
end
