# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :user_id, :question_id, :body, presence: { message: 'cannot be empty' }
end
