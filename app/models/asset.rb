require 'alpha_adapter'

class Asset < ApplicationRecord

  def self.get_by_ticker(ticker)
    AlphaAdapter.search(ticker)
  end

  def self.get_price(ticker, time)
    response = Asset.get_by_ticker(ticker)
    price = response["Time Series (1min)"][time]["4. close"]
  end


end
