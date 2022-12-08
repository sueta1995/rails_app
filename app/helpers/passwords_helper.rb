module PasswordsHelper
	def set_update_params
		@password_params = params.require(:user_password).permit(:old_password, :new_password, :new_password_confirmation)
	end

	def validation
		redirect_to('/users/edit', alert: 'Старый пароль не может быть старым') if @password_params[:old_password].empty?
		redirect_to('/users/edit', alert: 'Новый пароль не может быть пустым') if @password_params[:new_password].empty?
		redirect_to('/users/edit', alert: 'Поле подтверждения пароля не может быть пустым') if @password_params[:new_password_confirmation].empty?
	end

	def right_old_password
		redirect_to('/users/edit', alert: 'Неправильный пароль') if !User.find(current_user[:id])&.authenticate(@password_params[:old_password])
	end

	def confirmation
		redirect_to('/user/edit', alert: 'Пароли не совпадают') if @password_params[:new_password] != @password_params[:new_password_confirmation]
	end
end
