require 'get_data'

describe APICall do
    let :subject {described_class}


    it 'can return user id from email' do
      expect(subject.get_data).to eq "12DF-2324-GA2D-31RT"
    end
end
