require './lib/get_data.rb'

users = []

users += DataFetcher.get_available("users", users, APICall)
p users.count

#
# p users.user_data
# print users.users
