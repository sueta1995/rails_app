# frozen_string_literal: true

class BannedUser < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: { message: 'Идентификатор не может быть пустым' }
  validates :reason, presence: { message: 'Причина не может быть пустой' }
  
  validates :user_id, uniqueness: { message: 'Данный пользователь уже заблокирован' }

  # validates_existence_of :user_id, { message: 'Пользователь должен существовать' }
end
