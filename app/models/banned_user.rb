class BannedUser < ApplicationRecord
	belongs_to :user

	validates :user_id, :reason, presence: { message: 'cannot be empty' }
end
