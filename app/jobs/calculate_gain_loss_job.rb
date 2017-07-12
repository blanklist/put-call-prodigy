class CalculateGainLossJob < ApplicationJob
  include ContractsHelper
  queue_as :default

  def perform(contract)
    sold_time = alpha_time_adjustment(contract.created_at.time + contract.interval.minutes)
    sold_price = Equity.get_price(contract.ticker, sold_time)
    gain_loss = sold_price.to_f - contract.strike_price.to_f
    contract.update_attributes(:gain_loss => gain_loss)
  end
end
