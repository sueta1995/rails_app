module ShadowbansHelper
	def set_params
    @shadowban_params = params.require(:shadowban_user).permit(:user_id)
  end

  def set_destroy_params
    @shadowban_params = params.require(:shadowunban_user).permit(:user_id)
    @user = User.find_by(id: @shadowban_params[:user_id])
  end
end
