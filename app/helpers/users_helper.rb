# frozen_string_literal: true

# helper for users controller
module UsersHelper
  def set_params
    @user_params = params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
  end

  def create_ver
    session[:ver_code] = (0...6).map { ('0'..'9').to_a[rand(10)] }.join
    session[:ver_params] = @user_params
  end

  def set_info
    return unless @user_required.present?

    @is_user_banned = @user_required.banned_user.present?
    @followers_count = @user_required.followers.count
    @followings_count = @user_required.followings.count
    if current_user.present?
      @is_user_follower = Subscription.find_by(user_id: @user_required[:id],
                                               follower_id: current_user[:id]).present?
    end
    @user_questions = @user_required.questions.reverse
    @is_user_shadowbanned = @user_required.shadowbanned_user.present?
  end

  def set_destroy_params
    @destroy_params = params[:id]
  end

  def clear_user
    User.destroy(@destroy_params)
  end

  def check_edit
    redirect_to(root_path, alert: 'Вы не можете перейти на данную страницу!') if current_user.nil?
  end
end
