#!/usr/bin/env ruby
require './spend_tracker.rb'
require './user_finder.rb'
require './get_data.rb'
require './value_tracker.rb'
require './loyalty_tracker.rb'

customer_email = ARGV[1].gsub(/\[|\]/, '').downcase unless ARGV[1].nil?
action = ARGV[0]
spender = SpendTracker.new
users = UserFinder.new
loyal = LoyaltyTracker.new
value = ValueTracker.new

case action
  when "find_user_id"
    users.find_user_id(customer_email)
  when "total_spend"
    id = users.find_user_id(customer_email)
    spender.total_spend(id)
  when "average_spend"
    spender.average_spend(customer_email)
  when "most_loyal"
    loyal.find_most_frequent
  when "highest_value"
    value.find_most_valuable
  when "most_sold"
    value.find_most_valuable
  else
    puts "wrong method name"
end
