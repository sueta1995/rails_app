class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:nickname, :email, :password)
    user_check_nickname = User.find_by(nickname: user_params[:nickname])
    user_check_email = User.find_by(email: user_params[:email])

    if user_check_nickname.present?
      flash.now[:alert] = 'Пользователь с таким никнеймом уже существует!'

      render :new
    elsif user_check_email.present?
      flash.now[:alert] = 'Пользователь с такой почтой уже существует!'

      render :new
    else
      session[:ver_code] = (0...6).map { ('0'..'9').to_a[rand(10)] }.join
      session[:ver_params] = user_params

      UserMailer.with(user: session[:ver_params], code: session[:ver_code]).send_code.deliver_now
      redirect_to '/verifications/new'
    end
  end

  def show
    @user_required = User.find_by(id: params[:user_id])
  end

  def destroy
    session.delete(:user_id)
    User.find(params[:id]).delete

    redirect_to root_path, notice: 'Аккаунт удален!'
  end
end
