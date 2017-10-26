

class UserFinder

  def initialize(load_users: GetUserData.new)
    @load_users = load_users
  end

  def find_user(array, switch, lookup)
    array.find do |user_hash|
      user_hash[switch] == lookup
    end
  end

  def load_users_array
    @load_users.user_data
  end

  def find_info(switch, lookup)
    users_array = load_users_array
    user = find_user(users_array, switch, lookup)
    p user[switch]
    return user[switch]
  end
end

# class EmailFinder
#   def initialize(load_users: GetUserData.new)
#     p @load_users = load_users
#   end
#
#   def load_users_array
#     @load_users.user_data
#   end
#
#
#   def find_user(array, user_id)
#     array.find do |user_hash|
#       user_hash["id"] == user_id
#     end
#   end
#
#   def find_email(user_id)
#     user = find_user(@load_users, user_id)
#     p user["email"]
#     return user["email"]
#   end
# end
