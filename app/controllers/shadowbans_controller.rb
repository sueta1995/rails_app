class ShadowbansController < ApplicationController
  before_action :set_params, only: %i[create]
  before_action :set_destroy_params, only: %i[destroy]

  include ShadowbansHelper

  def new; end

  def create
    @shadowban = ShadowbannedUser.new(@shadowban_params)

    if @shadowban.save
      redirect_to(request.referrer, notice: 'Пользователь успешно заблокирован')
    else
      redirect_to(request.referrer, alert: error_msg_shadowbanned_user(@shadowban))
    end
  end

  def destroy
    if @user.present?
      if @user.shadowbanned_user.present?
        @user.shadowbanned_user = nil

        redirect_to(request.referrer, notice: 'Пользователь успешно разблокирован')
      else
        redirect_to(request.referrer, alert: 'Данный пользователь не заблокирован')
      end
    else
      redirect_to(request.referrer, alert: 'Указанный пользователь не найден')
    end
  end
end
