

class UserFinder

  def initialize(load_user: GetUserData.new)
    @load_user = load_user
  end

  def find_user(array, email)
    array.find do |user_hash|
      user_hash["email"] == email
    end
  end

  def load_users_array
    @load_user.user_data
  end

  def find_user_id(email)
    users_array = load_users_array
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
