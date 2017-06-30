class User < ApplicationRecord
	has_many :positions

	validates :user_id, presence: true
end
