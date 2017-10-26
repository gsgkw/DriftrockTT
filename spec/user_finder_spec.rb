require 'user_finder'
require 'get_data'

describe UserFinder do
  let(:load_user_double) { double :GetUserData }
  subject { described_class.new(load_user: load_user_double) }
  let(:email) { "drift.rock@email.com" }

  before do
    allow(load_user_double).to receive(:user_data) {
      [{ "id" => "12DF-2324-GA2D-31RT", "first_name" => "Drift", "last_name" => "Rock",
      "phone" => "0-200-100-1234", "email" => "drift.rock@email.com"
      }]
    }
  end

  it 'can return user id from email' do
    expect(subject.find_user_id(email)).to eq "12DF-2324-GA2D-31RT"
  end

end
