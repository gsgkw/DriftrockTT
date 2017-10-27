#!/usr/bin/env ruby
require './controller.rb'

customer_email = ARGV[1].gsub(/\[|\]/, '').downcase unless ARGV[1].nil?
action = ARGV[0]

case action
  when "total_spend"
    Controller.total_spend(customer_email)
  when "average_spend"
    Controller.average_spend(customer_email)
  when "most_loyal"
    Controller.most_loyal
  when "highest_value"
    Controller.highest_value
  when "most_sold"
    Controller.most_sold
  else
    Controller.error
end
