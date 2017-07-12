require 'alpha_adapter'

class Equity < ApplicationRecord

  has_many :contracts

  def self.get_by_ticker(ticker)
    AlphaAdapter.search(ticker)
  end

  def self.get_price(ticker, time)
    response = Equity.get_by_ticker(ticker)
    price = response["Time Series (1min)"][time]["4. close"]
  end
end
