# require 'data_fetcher'
#
# describe DataFetcher do
#   let(:api_double) { double :APICall }
#   let(:subject) { described_class }
#   before do
#     allow(api_double).to receive(:get_and_parse) { user_hash_array }
#   end
#   it 'can return array of hashes' do
#     destination = 'users'
#     users = []
#     api = api_double
#     expect(subject.load_available(destination, api)).to eq user_hash_array
#   end
# end
