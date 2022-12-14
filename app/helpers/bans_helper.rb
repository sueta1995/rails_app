# frozen_string_literal: true

# module for bans controller
module BansHelper
  def check_user
    redirect_to(root_path, alert: 'Вы не можете перейти по данной странице') unless session[:admin]
  end

  def set_params
    @ban_params = params.require(:ban_user).permit(:user_id, :reason)
  end

  def set_destroy_params
    @ban_params = params.require(:unban_user).permit(:user_id)
    @user = User.find_by(id: @ban_params[:user_id])
  end
end
