require "httparty"

class Stock

  ALPHAVANTAGE_BEGIN_URL = "https://www.alphavantage.co/query?function="
  private_constant :ALPHAVANTAGE_BEGIN_URL

  def initialize(symbol, time_interval)
    @symbol = symbol
    @time_interval = time_interval
  end

  def generate
    url = @time_interval == "Daily" ? construct_day_url : construct_intraday_url
    HTTParty.get(url).parsed_response["Time Series (#{@time_interval})"]
  end

  def construct_day_url
    # https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=MSFT&apikey=demo
    # https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=MSFT&outputsize=full&apikey=demo
    "#{ALPHAVANTAGE_BEGIN_URL}TIME_SERIES_DAILY&symbol=#{@symbol}&apikey=UIN02QE1RVT5HUFL"
  end

  def construct_intraday_url
    # https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=MSFT&interval=1min&apikey=demo
    # https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=MSFT&interval=15min&outputsize=full&apikey=demo
    "#{ALPHAVANTAGE_BEGIN_URL}TIME_SERIES_INTRADAY&symbol=#{@symbol}&interval=#{@time_interval}&apikey=UIN02QE1RVT5HUFL"
  end
end
