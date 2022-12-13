# frozen_string_literal: true

class BannedUser < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: { message: 'Идентификатор не может быть пустым' }
  validates :reason, presence: { message: 'Причина не может быть пустой' }
  
  validates :user_id, uniqueness: { message: 'Идентификатор должен быть уникальным' }
end
