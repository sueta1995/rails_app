module PasswordsHelper
	def set_update_params
		@password_params = params.require(:user_password).permit(:old_password, :new_password, :new_password_confirmation)
	end

	def validation
		redirect_to('/users/edit', alert: 'Старый пароль не может быть пустым') and return if @password_params[:old_password].empty?
	end

	def right_old_password
		redirect_to('/users/edit', alert: 'Неправильный пароль') if !User.find(current_user[:id])&.authenticate(@password_params[:old_password])
	end
end
