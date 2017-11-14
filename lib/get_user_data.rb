class GetUserData
  attr_reader :users

  def initialize(api: APICall, data_fetcher: DataFetcher)
    @users = []
    @users_end = "users"
    @api = api
    @data_fetcher = data_fetcher
  end

  def user_data
    @users = @data_fetcher.load_available(@users_end, @users, @api)
    return @users
  end

end
