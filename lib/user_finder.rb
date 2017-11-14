

class UserFinder

  def initialize(load_users: GetUserData.new)
    @load_users = load_users
    @users = []
    @email_key = "email"
    @id_key = "id"
  end

  def load_users_array
    p @users = @load_users.user_data
  end

  def find_user(key, known_info)
    @users.find do |user_hash|
      user_hash[key] == known_info
    end
  end

  def find_id_by_email(email)
    load_users_array
    user = find_user(@email_key, email)
    return user[@id_key]
  end

  def find_email_by_id(id)
    load_users_array
    user = find_user(@id_key, id)
    return user[@email_key]
  end
end
