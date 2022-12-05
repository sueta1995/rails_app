class VerificationsController < ApplicationController
  before_action :set_params, only: %i[create]

  include VerificationsHelper

  def new
  end

  def create
    if @verifications_form_code == session[:ver_code]
      User.create(session[:ver_params])
      
      delete_info

      redirect_to root_path, notice: 'Вы успешно зарегистрировались!'
    else
      flash.now[:alert] = 'Неправильный код!'

      render :new
    end
  end
end
