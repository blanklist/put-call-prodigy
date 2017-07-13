class CalculateGainLossJob < ApplicationJob
  include ContractsHelper
  queue_as :default

  def perform(contract)
    sold_time = alpha_time_adjustment(contract.created_at.time + contract.interval.minutes)
    sold_price = Equity.get_price(contract.ticker, sold_time)
    contract.update_attributes(:sold_price => sold_price)
    if contract.put_call = 'Call'
      gain_loss = sold_price.to_f - contract.strike_price.to_f
    else 
      gain_loss = contract.strike_price.to_f - sold_price.to_f
    end
    if gain_loss < 0
      gain_loss = 0
    end
    contract.update_attributes(:gain_loss => gain_loss)
  end
end
