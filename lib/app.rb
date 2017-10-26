#!/usr/bin/env ruby



customer_email = ARGV[1].gsub(/\[|\]/, '').downcase
action = ARGV[0]
app_class = CustomerTracker

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


case action
  when "find_user_id"
    app_class.find_user_id(customer_email)
  when "total_spend"
    app_class.total_spend(customer_email)
  when "average_spend"
    app_class.average_spend(customer_email)
  when "most_loyal"
    app_class.most_loyal
  when "most_sold"
    app_class.most_sold
  else
    puts "wrong method name"
end
