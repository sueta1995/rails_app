module UsersHelper
	def set_params
		@user_params = params.require(:user).permit(:nickname, :email, :password)
    @user_check_nickname = User.find_by(nickname: user_params[:nickname])
    @user_check_email = User.find_by(email: user_params[:email])
	end

	def create_ver
		session[:ver_code] = (0...6).map { ('0'..'9').to_a[rand(10)] }.join
    session[:ver_params] = user_params
	end

	def get_info
		@is_user_banned = BannedUser.find_by(user_id: @user_required[:id]).present?
		@followers_count = Subscription.where(user_id: @user_required[:id]).count
		@followings_count = Subscription.where(follower_id: @user_required[:id]).count
		@is_user_follower = Subscription.find_by(user_id: @user_required[:id], follower_id: current_user[:id]).present?
	end
end
