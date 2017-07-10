class ContractDataChannel < ApplicationCable::Channel
  def subscribed
    stream_from "contract_data"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
