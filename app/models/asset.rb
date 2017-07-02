class Asset < ApplicationRecord

  def get_by_ticker(ticker)
    AlphaAdapter.search(ticker)
  end
end