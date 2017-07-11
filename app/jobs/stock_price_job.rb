class StockPriceJob < ApplicationJob
  queue_as :default

  def perform
    # if Time.now > expiration && Contract.gain_loss == nil

    #   # Contract.calculate_gain_loss logic

    #   ActionCable.server.broadcast("stock_info_channel")
    puts 'stockpricejob test'
  end
end


# when does 'perform' occur?
# 