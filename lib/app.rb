#!/usr/bin/env ruby
require './customer_tracker.rb'
require './get_data.rb'


customer_email = ARGV[1].gsub(/\[|\]/, '').downcase
action = ARGV[0]
app_instance = CustomerTracker.new


case action
  when "find_user_id"
    app_instance.find_user_id(customer_email)
  when "total_spend"
    app_instance.total_spend(customer_email)
  when "average_spend"
    app_instance.average_spend(customer_email)
  when "most_loyal"
    app_instance.most_loyal
  when "most_sold"
    app_instance.most_sold
  else
    puts "wrong method name"
end
