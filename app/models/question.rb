class Question < ApplicationRecord
	has_many :comments, dependent: :destroy
	belongs_to :user

	validates :user_id, :body, presence: { message: 'cannot be empty' }
end
