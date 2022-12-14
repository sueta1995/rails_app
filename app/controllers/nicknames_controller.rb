# frozen_string_literal: true

# class of nicknames controller
class NicknamesController < ApplicationController
  before_action :set_update_params
  before_action :validation

  include NicknamesHelper

  def update
    @user = current_user

    if @user.update_column(:nickname, @nickname_params[:nickname])
      redirect_to(request.referrer, notice: 'Никнейм успешно изменен')
    else
      redirect_to(request.referrer, alert: error_msg_user(@user))
    end
  end
end
