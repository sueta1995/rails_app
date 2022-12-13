# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :comments, dependent: :destroy
  has_many :questions, dependent: :destroy

  has_many :followers, class_name: 'Subscription', foreign_key: 'user_id', dependent: :destroy
  has_many :followings, class_name: 'Subscription', foreign_key: 'follower_id', dependent: :destroy

  has_one :banned_user, dependent: :destroy
  has_one :admin_user, dependent: :destroy

  validates :nickname, :email, :password, :password_confirmation, presence: { message: 'cannot be empty' }

  validates :nickname, :email, uniqueness: true

  validates :nickname, format: {
    with: /\A[a-zA-Z][-a-zA-Z0-9_]+\z/,
    message: 'should be valid'
  }

  validates :email, format: {
    with: /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}/,
    message: 'should be valid'
  }

  validates :password, format: {
    with: /(?=.*[0-9])(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*]{6,}/,
    message: 'should be valid'
  }

  validates :password, confirmation: true
end
