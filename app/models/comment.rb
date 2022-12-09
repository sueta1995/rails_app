class Comment < ApplicationRecord
	validates :user_id, :body, presence: { message: 'cannot be empty' }
end
