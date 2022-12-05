# frozen_string_literal: true

# class of users controller
class UsersController < ApplicationController
  before_action :set_params, only: %i[create]

  # after_action :get_info, only: %i[show]

  include UsersHelper

  def new
    @user = User.new
  end

  def create
    if @user_check_nickname.present?
      flash.now[:alert] = 'Пользователь с таким никнеймом уже существует!'

      render :new
    elsif @user_check_email.present?
      flash.now[:alert] = 'Пользователь с такой почтой уже существует!'

      render :new
    else
      create_ver

      UserMailer.with(user: session[:ver_params], code: session[:ver_code]).send_code.deliver_now
      redirect_to '/verifications/new'
    end
  end

  def show
    @user_required = User.find_by(id: params[:user_id])

    set_info
  end

  def destroy
    session.delete(:user_id)
    User.find(params[:id]).delete

    redirect_to root_path, notice: 'Аккаунт удален!'
  end
end
