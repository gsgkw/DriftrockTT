require 'JSON'
require 'net/http'

users = []
hash_key = 'data'

i = 0
until i*1000 > users.count
  url = "https://driftrock-dev-test-2.herokuapp.com/users?per_page=1000&page=#{i}"
  uri = URI(url)
  response = Net::HTTP.get(uri)
  userdata = JSON.parse(response)[hash_key]
  users += userdata
  i += 1
end

puts users.count
puts i
