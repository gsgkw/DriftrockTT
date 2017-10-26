require 'JSON'
require 'net/http'


class GetUserData
  attr_reader :users

  def initialize(api = APICall)
    @users = []
    @users_end = "users"
    @api = api
  end

  def user_data
    GetData.get_all_data(@users_end, @users)
  end

end

class GetPurchasesData
  attr_reader :purchases

  def initialize(api = APICall)
    @purchases = []
    @purchases_end = "purchases"
    @api = api
  end

end




class GetData




  def add_to_array(local_array, parsed_data)
    local_array += parsed_data
  end

  def no_more_records?(page, records, received)
    page*records > received.count
  end

  def get_all_data(destination, local_array, api)
    local_array = []
    page = 0
    records = 1000
    until no_more_records?(page, records, local_array)
      parsed_data = api.get_and_parse(destination, page, records)
      add_to_array(local_array, parsed_data)
      page += 1
    end
  end

end



class APICall

  @hash_key = 'data'

  def get_json(uri)
    Net::HTTP.get(uri)
  end

  def set_uri(destination, page, records)
    URI("https://driftrock-dev-test-2.herokuapp.com/#{destination}?per_page=#{records}&page=#{page}")
  end

  def self.get_and_parse(destination, page, records)
    json_data = get_json(set_uri(destination, page, records))
    JSON.parse(json_data)[@hash_key]
  end


end
