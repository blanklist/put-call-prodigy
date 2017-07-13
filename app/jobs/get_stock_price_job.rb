class GetStockPriceJob < ApplicationJob
  queue_as :default

  def perform(ticker)
    puts Equity.get_by_ticker(ticker)
  end
end
