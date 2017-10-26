#!/usr/bin/env ruby

class CustomerTracker

def self.find_user_id(email)
  users_hash = {"guy@g.com"=>"abcdefg"}
  puts users_hash[email]
end


def self.total_spend(email)
end

def self.average_spend(email)
end

def self.most_loyal
end

def self.most_sold
end

end

customer_email = ARGV[1]

case ARGV[0]
when "find_user_id"
  CustomerTracker.find_user_id(customer_email)
when "total_spend"
  CustomerTracker.total_spend(customer_email)
when "average_spend"
  CustomerTracker.average_spend(customer_email)
when "most_loyal"
  CustomerTracker.most_loyal
when "most_sold"
  CustomerTracker.most_sold
else
  puts "wrong method name"
end
