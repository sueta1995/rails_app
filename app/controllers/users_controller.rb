# frozen_string_literal: true

# class of users controller
class UsersController < ApplicationController
  before_action :set_params, only: %i[create]
  before_action :set_destroy_params, only: %i[destroy]
  before_action :check_edit, only: %i[edit]

  # after_action :set_info, only: %i[show]

  include UsersHelper

  def new; end

  def create
    @user = User.new(@user_params)

    if @user.validate
      create_ver

      UserMailer.with(user: session[:ver_params], code: session[:ver_code]).send_code.deliver_now
      redirect_to '/verifications/new'
    else
      flash.now[:alert] = error_msg_user(@user)

      render :new
    end
  end

  def show
    @user_required = User.find_by(id: params[:user_id])

    set_info
  end

  def destroy
    session.delete(:user_id)

    clear_user

    redirect_to root_path, notice: 'Аккаунт удален!'
  end

  # action for edit view
  def edit; end
end
