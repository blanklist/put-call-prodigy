require 'httparty'
module AlphaAdapter

  def self.search(ticker)
    api_key = ALPHA_API
    up_function = 'TIME_SERIES_INTRADAY'
    up_ticker = ticker.upcase
    interval = 1
    url = "http://www.alphavantage.co/query?function=#{up_function}&symbol=#{up_ticker}&interval=#{interval}min&apikey=#{api_key}"
    response = HTTParty.get(url)
    response.parsed_response
  end

#Rate of Change
  def self.roc(ticker)
    api_key = ALPHA_API
    up_ticker = ticker.upcase
    interval = 'weekly'
    time_period = 10
    series_type = 'close'
    url = "http://www.alphavantage.co/query?function=ROC&symbol=#{up_ticker}&interval=#{interval}&time_period=#{time_period}&series_type=#{series_type}&apikey=#{api_key}"
    response = HTTParty.get(url)
    response.parsed_response
  end

#Relative Strength Index
  def self.rsi(ticker)
    api_key = ALPHA_API
    up_ticker = ticker.upcase
    interval = 15
    time_period = 10
    series_type = 'close'
    url = "http://www.alphavantage.co/query?function=RSI&symbol=#{up_ticker}&interval=#{interval}min&time_period=#{time_period}&series_type=#{series_type}&apikey=#{api_key}"
    response = HTTParty.get(url)
    response.parsed_response
  end

#Stochastic
  def self.stoch(ticker)
    api_key = ALPHA_API
    up_ticker = ticker.upcase
    interval = 15
    slowkmatype = 1
    slowdmatype = 1
    url = "http://www.alphavantage.co/query?function=STOCH&symbol=#{up_ticker}&interval=#{interval}min&slowkmatype=#{slowkmatype}&slowdmatype=#{slowdmatype}&apikey=#{api_key}"
    response = HTTParty.get(url)
    response.parsed_response
  end

#Bolinger Bands
  def self.bbands(ticker)
    api_key = ALPHA_API
    up_ticker = ticker.upcase
    interval = 'weekly'
    time_period = 5
    series_type = 'close'
    nbdevup = 3
    nbdevdn = 3
    url = "http://www.alphavantage.co/query?function=BBANDS&symbol=#{up_ticker}&interval=#{interval}&time_period=#{time_period}&series_type=#{series_type}&nbdevup=#{nbdevup}&nbdevdn=#{nbdevdn}&apikey=#{api_key}"
    response = HTTParty.get(url)
    response.parsed_response
  end
end


#NOTES-----------------------
# ENV['ALPHA_API']
# up_function = function.split.join('_').upcase
