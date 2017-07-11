require 'sidekiq-scheduler'
# require_relative '../jobs/stock_price_job'
# require_relative '../models/asset'

class ContractClosePriceWorker
  include Sidekiq::Worker
  # include 'stock_price_job'
  # include ApplicationJob
  # include Asset

  def perform
    puts 'test'
    # puts Asset.get_by_ticker("TSLA")
    # StockPriceJob.perform_later
  end
end
