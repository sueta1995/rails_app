module NicknamesHelper
	def set_update_params
		@nickname_params = params.require(:user_nickname).permit(:nickname)
	end
end
