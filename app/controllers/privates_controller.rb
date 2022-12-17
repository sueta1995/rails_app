# frozen_string_literal: true

# class of privates controller
class PrivatesController < ApplicationController
  before_action :set_update_params

  include PrivatesHelper

  def update
    @user = current_user
    user_is_private = @user.is_private

    if user_is_private
      @user.update_column(:is_private, false)

      redirect_to(request.referrer, notice: 'Теперь ваш аккаунт публичный')
    else
      @user.update_column(:is_private, true)

      redirect_to(request.referrer, notice: 'Теперь ваш аккаунт приватный')
    end
  end
end
