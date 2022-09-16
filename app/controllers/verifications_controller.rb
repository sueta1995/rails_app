class VerificationsController < ApplicationController
  def new
  end

  def create
    verifications_form_code = params.require(:verification).permit(:code)[:code]

    if verifications_form_code == session[:ver_code]
      User.create(session[:ver_params])

      session.delete(:ver_code)
      session.delete(:ver_params)

      redirect_to root_path, notice: 'Вы успешно зарегистрировались!'
    else
      flash.now[:alert] = 'Неправильный код!'

      render :new
    end
  end
end
