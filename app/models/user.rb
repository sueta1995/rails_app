# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :comments, dependent: :destroy
  has_many :questions, dependent: :destroy

  has_many :followers, class_name: 'Subscription', foreign_key: 'user_id', dependent: :destroy
  has_many :followings, class_name: 'Subscription', foreign_key: 'follower_id', dependent: :destroy

  has_one :banned_user, dependent: :destroy
  has_one :admin_user, dependent: :destroy
  has_one :shadowbanned_user, dependent: :destroy

  # validates :nickname, presence: { message: 'Никнейм не может быть пустым' }
  # validates :email, presence: { message: 'Почта не может быть пустой' }
  # validates :password, presence: { message: 'Пароль не может быть пустым' }
  validates :password_confirmation, presence: { message: 'Поле подтверждения пароля не может быть пустым' }

  validates :nickname, uniqueness: { message: 'Данный никнейм уже занят' }
  validates :email, uniqueness: { message: 'К данной почте уже привязан аккаунт' }

  validates :nickname, format: {
    with: /\A[a-zA-Z][-a-zA-Z0-9_]+\z/,
    message: 'Никнейм должен быть валидным'
  }

  validates :email, format: {
    with: /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}/,
    message: 'Почта должна быть валидной'
  }

  validates :password, format: {
    with: /(?=.*[0-9])(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*]{6,}/,
    message: 'Пароль должен быть валидным'
  }

  validates :password, confirmation: { message: 'Пароли не совпадают' }
end
