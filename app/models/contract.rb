class Contract < ApplicationRecord
  include ContractsHelper

  belongs_to :user

  def expiration
    created_at.time + interval.minutes
  end

  def gain_loss
  	if Time.now > expiration
  		sold_time = alpha_time_adjustment(expiration)
  		sold_price = Asset.get_price(ticker, sold_time)
  		if sold_price.to_i - spot_price.to_i > 0
  			gain = sold_price.to_i - spot_price.to_i
  			
  		else
  			return loss = sold_price.to_i - spot_price.to_i
  		end
  	end
  end

end
