# frozen_string_literal: true

class AdminUser < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: { message: 'cannot be empty' }
end
