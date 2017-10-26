require 'JSON'
require 'net/http'

class GetUserData
  attr_reader :users

  def initialize(api = APICall, data_fetcher = DataFetcher)
    @users = []
    @users_end = "users"
    @api = api
    @data_fetcher = data_fetcher
  end

  def user_data
    @users = []
    @users = @data_fetcher.get_available(@users_end, @users, @api)
  end

end

class GetPurchasesData
  attr_reader :purchases

  def initialize(api = APICall, data_fetcher = DataFetcher)
    @purchases = []
    @purchases_end = "purchases"
    @api = api
    @data_fetcher = data_fetcher
  end

  def purchases_data
    @purchases = []
    @purchases = @data_fetcher.get_available(@purchases_end, @purchases, @api)
  end
end

class DataFetcher

  def self.no_more_records?(page, records, received)
    page * records > received.count
  end

  def self.get_available(destination, local_array, api)
    received_records = local_array
    page = 0
    records = 1000
    until no_more_records?(page, records, received_records)
      received_records += api.get_and_parse(destination, page, records)
      page += 1
    end
    return received_records
  end

end

class APICall

  @hash_key = 'data'

  def self.get_json(uri)
    Net::HTTP.get(uri)
  end

  def self.set_uri(destination, page, records)
    address = "https://driftrock-dev-test-2.herokuapp.com"
    URI("#{address}/#{destination}?per_page=#{records}&page=#{page}")
  end

  def self.get_and_parse(destination, page, records)
    json_data = get_json(set_uri(destination, page, records))
    JSON.parse(json_data)[@hash_key]
  end

end
