# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: { message: 'Идентификатор подписки не может быть пустым' }
  validates :follower_id, presence: { message: 'Идентификатор подписчика не может быть пустым' }
end
