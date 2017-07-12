class Contract < ApplicationRecord
  include ContractsHelper

  belongs_to :user
  belongs_to :equity

  def expiration
    # created_at.time + interval.minutes
    expiration = "2017-07-12 16:00:00"
  end

end
