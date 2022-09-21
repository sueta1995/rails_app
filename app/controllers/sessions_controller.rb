class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:session)

    user = User.find_by(email: user_params[:email])&.authenticate(user_params[:password])

    if user.present?
      ban_status = BannedUser.find_by(user_id: user.id)

      if ban_status.present?
        flash.now[:alert] = "Вы не можете зайти в этот аккаунт, так как он заблокирован по причине: #{ban_status.reason}!"

        render :new
      else
        session[:user_id] = user.id 
        session[:nickname] = user.nickname
      
        redirect_to root_path, notice: 'Вы упешно зашли в аккаунт!'
      end
    else
      flash.now[:alert] = 'Неправильные email или пароль!'

      render :new
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to root_path, notice: "Вы вышли из аккаунта!"
  end
end
