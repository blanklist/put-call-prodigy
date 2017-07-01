require 'net/http'
require 'uri'
require 'json'

class AlphaAdapter
  include HTTParty


  base_uri 'www.alphavantage.co/'
  format :json
  #AV uses symbol instead of ticker
  #interval - 1 / 5 / 15 / 30 / and 60 min
  #function - TIME_SERIES_# intraday - daily - weekly - monthly

  def self.search
    api_key = 'T16XX6XEII8AXKZJ'
    up_function = 'TIME_SERIES_INTRADAY'
    ticker = 'MSFT'
    interval = 1

    url = URI("http://www.alphavantage.co/query?function=#{up_function}&symbol=#{ticker}&interval=#{interval}min&apikey=#{api_key}")

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Get.new(url)

    response = JSON.parse(http.request(request).read_body)
    p response
  end
end


# ENV['ALPHA_API']

# up_function = function.split.join('_').upcase
