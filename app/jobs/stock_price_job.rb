class StockPriceJob < ApplicationJob
  queue_as :default

  def perform
    if Time.now > expiration && Contract.gain_loss == nil
      
      # call API for price
      # update contract

      ActionCable.server.broadcast("stock_info_channel")
    end
  end
end
