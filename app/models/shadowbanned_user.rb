class ShadowbannedUser < ApplicationRecord
	belongs_to :user

  validates :user_id, presence: { message: 'Идентификатор не может быть пустым' }
  
  validates :user_id, uniqueness: { message: 'Данный пользователь уже заблокирован' }
end
