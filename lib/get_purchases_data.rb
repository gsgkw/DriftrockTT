require 'JSON'
require 'net/http'

class GetPurchasesData
  attr_reader :purchases

  def initialize(api: APICall, data_fetcher: DataFetcher)
    @purchases = []
    @purchases_end = "purchases"
    @api = api
    @data_fetcher = data_fetcher
  end

  def purchases_data
    @purchases = []
    @purchases = @data_fetcher.load_available(@purchases_end, @purchases, @api)
  end
end
