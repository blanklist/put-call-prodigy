class Contract < ApplicationRecord
  include ContractsHelper

  belongs_to :user

  def expiration
    created_at.time + interval.minutes
  end

  def calculate_gain_loss
  	if Time.now > expiration && self.gain_loss == nil
  		sold_time = alpha_time_adjustment(expiration)
      sold_price = Asset.get_price(ticker, sold_time)
  		gain_loss = sold_price.to_f - spot_price.to_f
      self.update_attributes(:gain_loss => gain_loss)
    end
  end
  
end