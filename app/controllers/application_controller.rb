class ApplicationController < ActionController::Base
	helper_method :current_user

	before_action :check_ban

	private

	def current_user
		@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
	end

	def check_ban
		if current_user.present?
			if BannedUser.find_by(user_id: current_user.id).present?
				session.delete(:user_id)

				redirect_to('/main', alert: 'Вас заблокировали!')
			end
		end
	end
end
