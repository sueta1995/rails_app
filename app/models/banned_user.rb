# frozen_string_literal: true

class BannedUser < ApplicationRecord
  belongs_to :user

  validates :user_id, :reason, presence: { message: 'cannot be empty' }
  validates :user_id, uniqueness: true
end
