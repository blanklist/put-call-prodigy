class StockInfoChannel < ApplicationCable::Channel
  def subscribed
    stream_from "stock_info_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
