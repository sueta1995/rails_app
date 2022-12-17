class Dialogue < ApplicationRecord
	belongs_to :first_user, class_name: 'User'

	validates :first_user_id, presence: { message: 'Идентификатор первого пользователя не может быть пустым' }
	validates :second_user_id, presence: { message: 'Идентификатор второго пользователя не может быть пустым' }
end
