#!/usr/bin/env ruby
require './spend_tracker.rb'
require './user_finder.rb'
require './get_data.rb'


customer_email = ARGV[1].gsub(/\[|\]/, '').downcase
action = ARGV[0]



case action
  when "find_user_id"
    UserFinder.new.find_user_id(customer_email)
  when "total_spend"
    id = UserFinder.new.find_user_id(customer_email)
    SpendTracker.new.total_spend(id)
  when "average_spend"
    app_instance.average_spend(customer_email)
  when "most_loyal"
    app_instance.most_loyal
  when "most_sold"
    app_instance.most_sold
  else
    puts "wrong method name"
end
