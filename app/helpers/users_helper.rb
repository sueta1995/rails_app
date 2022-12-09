# frozen_string_literal: true

# helper for users controller
module UsersHelper
  def set_params
    @user_params = params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
    @user_check_nickname = User.find_by(nickname: @user_params[:nickname])
    @user_check_email = User.find_by(email: @user_params[:email])
  end

  def create_ver
    session[:ver_code] = (0...6).map { ('0'..'9').to_a[rand(10)] }.join
    session[:ver_params] = @user_params
  end

  def set_info
    if @user_required.present?
      @is_user_banned = BannedUser.find_by(user_id: @user_required[:id]).present?
      @followers_count = Subscription.where(user_id: @user_required[:id]).count
      @followings_count = Subscription.where(follower_id: @user_required[:id]).count
      @is_user_follower = Subscription.find_by(user_id: @user_required[:id], follower_id: current_user[:id]).present? if current_user.present?
      @user_questions = Question.where(user_id: @user_required[:id]).reverse
    end
  end

  def validation
    redirect_to('/users/new', alert: 'Введите валидный никнейм') and return if !/^[a-zA-Z][a-zA-Z0-9-_]+$/.match?(@user_params[:nickname])
    redirect_to('/users/new', alert: 'Введите валидную почту') and return if !/[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/.match?(@user_params[:email])
    redirect_to('/users/new', alert: 'Введите валидный пароль') and return if !/(?=.*[0-9])(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*]{6,}/.match?(@user_params[:password])
  end

  def set_destroy_params
    @destroy_params = params[:id]
  end

  def clear_user
    User.delete(@destroy_params)

    BannedUser.delete_by(user_id: @destroy_params)
    Question.delete_by(user_id: @destroy_params)
    Subscription.delete_by(user_id: @destroy_params)
    Subscription.delete_by(follower_id: @destroy_params)
    Comment.delete_by(user_id: @destroy_params)
  end

  def check_edit
    redirect_to(root_path, alert: 'Вы не можете перейти на данную страницу!') if current_user.nil?
  end
end
