
class DataFetcher

  def self.load_available(destination, api)
    received_records = []
    page = 1
    records = 1000
    received_records += api.get_and_parse(destination, page, records)
    loop do
      puts page
      page +=1
      api_records = api.get_and_parse(destination, page, records)
      break if api_records.last == nil
      received_records += api_records
    end
    received_records
  end

end
