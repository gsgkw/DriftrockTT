

class UserFinder

  def initialize(load_users: GetUserData.new)
    @load_users = load_users
  end

  def find_user(array, email)
    array.find do |user_hash|
      user_hash["email"] == email
    end
  end

  def load_users_array
    @load_users.user_data
  end

  def find_user_id(email)
    users_array = load_users_array
    user = find_user(users_array, email)
    p user["id"]
    return user["id"]
  end
end

class EmailFinder
  def initialize(load_users: GetUserData.new)
    p @load_users = load_users.user_data
  end

  def find_user(array, user_id)
    array.find do |user_hash|
      user_hash["id"] == user_id
    end
  end

  def find_email(user_id)
    user = find_user(@load_users, user_id)
    p user["email"]
    return user["email"]
  end
end
