class NicknamesController < ApplicationController
  before_action :set_update_params

  include NicknamesHelper

  def update
    @user = User.find(current_user[:id])

    if @user.update(nickname: @nickname_params[:nickname])
      redirect_to(request.referrer, notice: 'Никнейм успешно изменен')
    else
      redirect_to(request.referrer, alert: @user.errors.full_messages[0])
    end
  end
end
