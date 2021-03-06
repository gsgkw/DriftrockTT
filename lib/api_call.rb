require 'json'
require 'net/http'

class APICall

  @hash_key = 'data'

  def self.get_json(uri)
    Net::HTTP.get(uri)
  end

  def self.set_uri(destination, page)
    address = "https://driftrock-dev-test-2.herokuapp.com"
    URI("#{address}/#{destination}?per_page=1000&page=#{page}")
  end

  def self.get_and_parse(destination, page)
    json_data = get_json(set_uri(destination, page))
    JSON.parse(json_data)[@hash_key]
  end

end
