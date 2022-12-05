# frozen_string_literal: true

# class of sessions controller
class SessionsController < ApplicationController
  before_action :set_params, only: %i[create]
  before_action :validation, only: %i[create]

  include SessionsHelper

  def new; end

  def create
    if @user.present?
      ban_status = BannedUser.find_by(user_id: @user.id)

      if ban_status.present?
        flash.now[:alert] =
          "Вы не можете зайти в этот аккаунт, так как он заблокирован по причине: #{ban_status.reason}!"

        render :new
      else
        set_info

        redirect_to root_path, notice: 'Вы упешно зашли в аккаунт!'
      end
    else
      flash.now[:alert] = 'Неправильные email или пароль!'

      render :new
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to root_path, notice: 'Вы вышли из аккаунта!'
  end
end
