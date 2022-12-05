module SessionsHelper
	def set_params
		@user_params = params.require(:session)
    @user = User.find_by(email: @user_params[:email])&.authenticate(@user_params[:password])
	end

	def set_info
		session[:user_id] = @user.id 
    session[:nickname] = @user.nickname
	end
end
