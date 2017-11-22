
class DataFetcher

  def initialize (api: APICall)
    @api = api
    @purchases_end = "purchases"
    @user_end = "users"
    @received_records = []
  end

  def load_available(destination)
    page = 1
    loop do
      api_records = @api.get_and_parse(destination, page)
      break if api_records.last == nil
      @received_records += api_records
      page +=1
    end
  end

  def get_records(destination)
    @received_records = []
    load_available(destination)
    @received_records
  end

  def get_purchases
    get_records(@purchases_end)
  end

  def get_users
    get_records(@user_end)
  end

end
