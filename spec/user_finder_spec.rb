require 'user_finder'

describe UserFinder do
  let(:load_user_double) { double :GetUserData }
  subject { described_class.new(load_users: load_user_double) }
  let(:email) { "drift.rock@email.com" }
  let(:id) { "12DF-2324-GA2D-31RT" }

  before do
    allow(load_user_double).to receive(:user_data) { user_hash_array }
  end

  it 'can return user id from email' do
    expect(subject.find_id_by_email(email)).to eq "12DF-2324-GA2D-31RT"
  end

  it 'can return email from user id' do
    expect(subject.find_email_by_id(id)).to eq "drift.rock@email.com"
  end

end
