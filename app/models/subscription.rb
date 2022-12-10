class Subscription < ApplicationRecord
	belongs_to :user

	validates :user_id, :follower_id, presence: { message: 'cannot be empty' }
end
