require 'alpha_adapter'

class Equity < ApplicationRecord

  has_many :contracts

  def self.get_by_ticker(ticker)
    AlphaAdapter.search(ticker)
  end

  def self.get_price(ticker, time = "2017-07-12 15:59:00")
    response = Equity.get_by_ticker(ticker)
    price = response["Time Series (1min)"][time]["4. close"]
  end
end
