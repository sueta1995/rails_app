class BannedUser < ApplicationRecord
	validates :user_id, :reason, presence: { message: 'cannot be empty' }
end
