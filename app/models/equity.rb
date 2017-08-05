require 'alpha_adapter'

class Equity < ApplicationRecord

  has_many :contracts

  def self.last_refreshed(ticker)
    AlphaAdapter.search(ticker)["Meta Data"]["3. Last Refreshed"]
  end

  # def self.get_by_ticker(ticker)
  #   AlphaAdapter.search(ticker)
  # end

  # def self.get_price(ticker, time = last_refreshed(ticker))
  #   response = Equity.get_by_ticker(ticker)
  #   price = response["Time Series (1min)"][time]["4. close"]
  # end

  def self.get_price(ticker, time = last_refreshed(ticker))
    response = AlphaAdapter.search(ticker)
    price = response["Time Series (1min)"][time]["4. close"]
  end

  # def self.get_roc(ticker, time = last_refreshed(ticker))
  #   AlphaAdapter.roc(ticker)["Technical Analysis: ROC"]["3. Last Refreshed"]["ROC"]
  # end

  def self.get_roc(ticker, time = last_refreshed(ticker))
    response = AlphaAdapter.roc(ticker)
    return response["Technical Analysis: ROC"]["2017-08-04"]["ROC"]
  end

  def self.get_rsi(ticker)
    AlphaAdapter.rsi(ticker)["Technical Analysis: RSI"]["2017-07-13 09:30"]["RSI"]
  end

  def self.get_mfi(ticker)
    AlphaAdapter.mfi(ticker)["Technical Analysis: MFI"]["2017-07-07"]["MFI"]
  end

  def self.get_adx(ticker)
    AlphaAdapter.adx(ticker)["Technical Analysis: ADX"]["2017-07-13 09:30"]["ADX"]
  end

  def self.get_obv(ticker)
    AlphaAdapter.obv(ticker)["Technical Analysis: OBV"]["2017-07-07"]["OBV"]
  end

  def self.get_sma(ticker)
    AlphaAdapter.sma(ticker)["Technical Analysis: SMA"]["2017-07-07"]["SMA"]
  end

  def self.get_ema(ticker)
    AlphaAdapter.ema(ticker)["Technical Analysis: EMA"]["2017-07-07"]["EMA"]
  end

  def self.get_stoch_d(ticker)
    AlphaAdapter.stoch(ticker)["Technical Analysis: STOCH"]["2017-07-13 09:30"]["SlowD"]
  end

  def self.get_stoch_k(ticker)
    AlphaAdapter.stoch(ticker)["Technical Analysis: STOCH"]["2017-07-13 09:30"]["SlowK"]
  end

end
