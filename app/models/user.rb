class User < ApplicationRecord
	has_secure_password

	validates :nickname, :email, uniqueness: true
	validates :nickname, :email, :password_digest, presence: { message: 'cannot be empty' }
end
