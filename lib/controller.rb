require './spend_tracker.rb'
require './user_finder.rb'
require './get_data.rb'
require './value_tracker.rb'
require './loyalty_tracker.rb'
require './item_tracker.rb'

class Controller

  def self.total_spend(email)
    id = UserFinder.new.find_id_by_email(email)
    p SpendTracker.new.total_spend(id)
  end

  def self.average_spend(email)
    id = UserFinder.new.find_id_by_email(email)
    p SpendTracker.new.average_spend(id)
  end

  def self.most_loyal
    id = LoyaltyTracker.new.find_most_frequent
    p UserFinder.new.find_email_by_id(id)
  end

  def self.highest_value
    id = ValueTracker.new.find_most_valuable
    p UserFinder.new.find_email_by_id(id)
  end

  def self.most_sold
    p ItemTracker.new.find_most_frequent
  end

  def self.error
    puts "wrong method name"
  end
end
