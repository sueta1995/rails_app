# frozen_string_literal: true

# class of question controller
class QuestionsController < ApplicationController
  before_action :set_params, only: %i[create]

  include QuestionsHelper

  def new; end

  def create
    @question = Question.new(body: @question_params[:body], user_id: current_user[:id])

    if @question.save
      redirect_to(request.referrer, notice: 'Вы успешно опубликовали запись')
    else
      redirect_to(request.referrer, alert: error_msg_question(@question))
    end
  end

  def destroy
    Question.destroy(params[:id])

    redirect_to("/users/#{current_user.id}", notice: 'Вы успешно удалили запись')
  end

  def show
    @question_required = Question.find_by(id: params[:question_id])

    set_info
  end
end
