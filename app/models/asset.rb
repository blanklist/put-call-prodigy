class Asset < ApplicationRecord

  def self.get(ticker, time)
    AlphaAdapter.search(ticker, time)
  end

end