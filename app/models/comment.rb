# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :user_id, presence: { message: 'Идентификатор не может быть пустым' }
  validates :question_id, presence: { message: 'Идентификатор записи не может быть пустым' }
  validates :body, presence: { message: 'Тело комментария не может быть пустым' }
end
