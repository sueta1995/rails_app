class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:session)

    user = User.find_by(email: user_params[:email])

    if user.present?
      session[:user_id] = user.id 
      session[:nickname] = user.nickname
      
      redirect_to root_path, notice: 'Вы упешно зашли на сайт!'
    else
      flash.now[:alert] = 'Неправильный email или пароль!'

      render :new
   end
  end

  def destroy
    session.delete(:user_id)

    redirect_to root_path, notice: "Вы вышли из аккаунта"
  end
end
