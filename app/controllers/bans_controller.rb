# frozen_string_literal: true

# class on bans controller
class BansController < ApplicationController
  before_action :check_user, only: %i[new]
  before_action :set_params, only: %i[create]
  before_action :set_destroy_params, only: %i[destroy]

  include BansHelper

  def new; end

  def create
    @ban = BannedUser.new(@ban_params)

    if @ban.save
      redirect_to(request.referrer, notice: 'Пользователь успешно заблокирован')
    else
      redirect_to(request.referrer, alert: @ban.errors.full_messages[0])
    end
  end

  def destroy
    if @user.present?
      if @user.banned_user.present?
        @user.banned_user = nil

        redirect_to(request.referrer, notice: 'Пользователь успешно разблокирован')
      else
        redirect_to(request.referrer, alert: 'Данный пользователь не заблокирован')
      end
    else
      redirect_to(request.referrer, alert: 'Указанный пользователь не найден')
    end
  end
end
