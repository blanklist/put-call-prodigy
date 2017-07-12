class GetStockPriceJob < ApplicationJob
  queue_as :default

  def perform(ticker)
    puts Asset.get_by_ticker(ticker)
  end
end
