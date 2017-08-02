class Contract < ApplicationRecord
  include ContractsHelper

  belongs_to :user
  belongs_to :equity

  def expiration
    created_at.time + interval.minutes
  end

end
