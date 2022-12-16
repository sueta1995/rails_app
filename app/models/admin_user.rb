# frozen_string_literal: true

class AdminUser < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: { message: 'Идентификатор не может быть пустым' }
end
