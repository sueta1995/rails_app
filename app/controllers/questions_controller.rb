class QuestionsController < ApplicationController
  before_action :set_params, only: %i[create]
  before_action :validation, only: %i[create]

  include QuestionsHelper

  def new
  end

  def create
    Question.create(user_id: current_user.id, body: @question_params[:body])

    redirect_to("/users/#{current_user.id}", notice: 'Вы успешно опубликовали запись')
  end

  def destroy
    Question.delete(params[:id])

    redirect_to("/users/#{current_user.id}", notice: 'Вы успешно удалили запись')
  end

  def show
    @question_required = Question.find(params[:question_id])
    @question_user = User.find(@question_required[:user_id])

    set_info
  end
end
