class Asset < ApplicationRecord

  def self.get(ticker)
    AlphaAdapter.search(ticker)
  end

end