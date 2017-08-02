class GetStockPriceJob < ApplicationJob
  queue_as :default

  def perform(ticker)
    Equity.get_by_ticker(ticker)
  end
end
