class CommentsController < ApplicationController
  before_action :set_params, only: %i[create]
  before_action :validation, only: %i[create]

  include CommentsHelper

  def new
  end
  
  def create
    Comment.create(user_id: current_user.id, question_id: @comment_params[:question_id], body: @comment_params[:body])

    redirect_to("/questions/#{@comment_params[:question_id]}", notice: 'Вы успешно опубликовали комментарий')
  end

  def destroy
    Comment.delete(params[:id])

    redirect_to("/questions/#{@comment_params[:question_id]}", notice: 'Вы успешно удалили запись')
  end
end
