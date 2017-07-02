class Contract < ApplicationRecord
  belongs_to :user

  def expiration
    self.created_at.time + self.interval.minutes
  end

end
