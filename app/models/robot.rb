class Robot < ApplicationRecord
  belongs_to :user
  before_save :assign_url

  validates_presence_of :name

  def assign_url
    self.summon = "https://robohash.org/#{self.name}.png"
  end

end
