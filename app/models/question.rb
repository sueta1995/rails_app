# frozen_string_literal: true

class Question < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :user_id, presence: { message: 'Идентификатор не может быть пустым' }
  validates :body, presence: { message: 'Тело записи не может быть пустым' }
end
