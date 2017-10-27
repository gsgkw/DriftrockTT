require 'simplecov'
require 'simplecov-console'

def user_hash_array
  [{ "id" => "12DF-2324-GA2D-31RT", "first_name" => "Drift", "last_name" => "Rock",
"phone" => "0-200-100-1234", "email" => "drift.rock@email.com"
}, { "id" => "1234-2324-GA2D-31RT", "first_name" => "Drit", "last_name" => "Rocc",
"phone" => "0-999-999-1234", "email" => "drit.rocc@email.com"
}]
end

def purchases_hash_array
  [{ "user_id" => "12DF-2324-GA2D-31RT", "item" => "Huge pineapple pizza", "spend" => "19.99"
  }, { "user_id" => "12DF-2324-GA2D-31RT", "item" => "A nice cup of tea", "spend" => "2.99"
  }, { "user_id" => "12DF-2324-GA2D-31RT", "item" => "A nice cup of tea", "spend" => "2.99"
  }, { "user_id" => "1234-2324-GA2D-31RT", "item" => "Enormous pineapple pizza", "spend" => "99.99"
  }, { "user_id" => "1234-2324-GA2D-31RT", "item" => "A nice cup of tea", "spend" => "2.99"
  }]
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console])
SimpleCov.start

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
