module NicknamesHelper
	def set_update_params
		@nickname_params = params.require(:user_nickname).permit(:nickname)
	end

	def validation
		redirect_to('/users/edit', alert: 'Никнейм не может быть пустым') if @nickname_params[:nickname].empty?
	end

	def exist_nickname
		redirect_to('/users/edit', alert: 'Данный никнейм занят') if User.find_by(nickname: @nickname_params[:nickname]).present?
	end
end
