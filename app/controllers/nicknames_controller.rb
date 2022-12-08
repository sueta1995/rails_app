class NicknamesController < ApplicationController
  before_action :set_update_params
  before_action :validation
  before_action :exist_nickname

  include NicknamesHelper

  def update
    User.find(current_user[:id]).update(nickname: @nickname_params[:nickname])

    redirect_to('/users/edit', notice: 'Никнейм успешно изменен')
  end
end
