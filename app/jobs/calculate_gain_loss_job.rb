class CalculateGainLossJob < ApplicationJob
  include ContractsHelper
  queue_as :default

  def perform(contract)
    sold_time = alpha_time_adjustment(contract.created_at.time + contract.interval.minutes)
    p sold_time
    sold_price = Equity.get_price(contract.ticker, sold_time)
    p sold_price
    if contract.put_call = 'Call'
      gain_loss = sold_price.to_f - contract.strike_price.to_f
    else 
      gain_loss = contract.strike_price.to_f - sold_price.to_f
    end
    return 0 if gain_loss < 0
    contract.update_attributes(:gain_loss => gain_loss)
  end
end
