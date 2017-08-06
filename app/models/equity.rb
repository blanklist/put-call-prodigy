require 'alpha_adapter'

class Equity < ApplicationRecord

  has_many :contracts

  def self.last_refreshed(ticker)
    AlphaAdapter.search(ticker)["Meta Data"]["3. Last Refreshed"]
  end

  def self.get_price(ticker, time = last_refreshed(ticker))
    response = AlphaAdapter.search(ticker)
    price = response["Time Series (1min)"][time]["4. close"]
  end

  def self.get_roc(ticker)
    response = AlphaAdapter.roc(ticker)
    last_response_time = response["Meta Data"]["3: Last Refreshed"]
    response["Technical Analysis: ROC"][last_response_time]["ROC"]
  end

  def self.get_rsi(ticker)
    response = AlphaAdapter.rsi(ticker)
    last_response_time = response["Meta Data"]["3: Last Refreshed"]
    time_without_seconds = last_response_time.chomp[0..-4]
    response["Technical Analysis: RSI"][time_without_seconds]["RSI"]
  end

  def self.get_mfi(ticker)
    response = AlphaAdapter.mfi(ticker)
    last_response_time = response["Meta Data"]["3: Last Refreshed"]
    response["Technical Analysis: MFI"][last_response_time]["MFI"]
  end

  def self.get_adx(ticker)
    response = AlphaAdapter.adx(ticker)
    last_response_time = response["Meta Data"]["3: Last Refreshed"]
    time_without_seconds = last_response_time.chomp[0..-4]
    response["Technical Analysis: ADX"][time_without_seconds]["ADX"]
  end

  def self.get_obv(ticker)
    response = AlphaAdapter.obv(ticker)
    last_response_time = response["Meta Data"]["3: Last Refreshed"]
    response["Technical Analysis: OBV"][last_response_time]["OBV"]
  end

  def self.get_sma(ticker)
    response = AlphaAdapter.sma(ticker)
    last_response_time = response["Meta Data"]["3: Last Refreshed"]    
    response["Technical Analysis: SMA"][last_response_time]["SMA"]
  end

  def self.get_ema(ticker)
    response = AlphaAdapter.ema(ticker)
    last_response_time = response["Meta Data"]["3: Last Refreshed"]
    response["Technical Analysis: EMA"][last_response_time]["EMA"]
  end

  def self.get_stoch_d(ticker)
    response = AlphaAdapter.stoch(ticker)
    last_response_time = response["Meta Data"]["3: Last Refreshed"]
    time_without_seconds = last_response_time.chomp[0..-4]
    response["Technical Analysis: STOCH"][time_without_seconds]["SlowD"]
  end

  def self.get_stoch_k(ticker)
    response = AlphaAdapter.stoch(ticker)
    last_response_time = response["Meta Data"]["3: Last Refreshed"]
    time_without_seconds = last_response_time.chomp[0..-4]
    response["Technical Analysis: STOCH"][time_without_seconds]["SlowK"]
  end

end
