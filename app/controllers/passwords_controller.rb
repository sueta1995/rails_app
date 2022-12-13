# frozen_string_literal: true

# class of passwords controller
class PasswordsController < ApplicationController
  before_action :set_update_params
  before_action :validation
  before_action :right_old_password

  include PasswordsHelper

  def update
    @user = current_user

    if @user.update(nickname: @user.nickname, email: @user.email, password: @password_params[:new_password],
                    password_confirmation: @password_params[:new_password_confirmation])
      redirect_to('/users/edit', notice: 'Пароль успешно изменен')
    else
      redirect_to('/users/edit', alert: @user.errors.full_messages[0])
    end
  end
end
