class Subscription < ApplicationRecord
	validates :user_id, :follower_id, presence: { message: 'cannot be empty' }
end
