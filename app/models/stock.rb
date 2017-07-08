require "httparty"

class Stock

  attr_reader :graph_values

  ALPHAVANTAGE_BEGIN_URL = "https://www.alphavantage.co/query?function="
  private_constant :ALPHAVANTAGE_BEGIN_URL

  def initialize(symbol, time_interval)
    @symbol = symbol
    @time_interval = time_interval
    @graph_values = {}
  end

  def generate
    url = @time_interval == "day" ? construct_day_url : construct_intraday_url
    @resource = HTTParty.get(url).parsed_response["Time Series (15min)"]
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

  def extract_graph_data
    @resource.each do |k,v|
      @graph_values[k] = v["4. close"]
    end
  end

  def get_ten_values
    @graph_values.first(10).to_h
  end
end
