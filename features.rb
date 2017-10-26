require './lib/get_data.rb'

users = []
purchases = []
users += DataFetcher.get_available("users", users, APICall)
p users

# purchases += DataFetcher.get_available("purchases", purchases, APICall)
# p purchases.count

#
# p users.user_data
# print users.users
