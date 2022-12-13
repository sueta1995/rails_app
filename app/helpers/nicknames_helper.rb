# frozen_string_literal: true

# helper for nicknames controller
module NicknamesHelper
  def set_update_params
    @nickname_params = params.require(:user_nickname).permit(:nickname)
  end

  def validation
    unless /^[a-zA-Z][a-zA-Z0-9-_]+$/.match?(@nickname_params[:nickname])
      redirect_to('/users/edit',
                  alert: 'Введите валидный никнейм')
    end
    return unless User.find_by(nickname: @nickname_params[:nickname]).present?

    redirect_to('/users/edit',
                alert: 'Данный никнейм занят')
  end
end
