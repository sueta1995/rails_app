class PasswordsController < ApplicationController
  before_action :set_update_params
  before_action :validation
  before_action :right_old_password
  before_action :confirmation

  include PasswordsHelper

  def update
    User.find(current_user[:id]).update(password: @password_params[:new_password])

    redirect_to('/users/edit', notice: 'Пароль успешно изменен')
  end
end
