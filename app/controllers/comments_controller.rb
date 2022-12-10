class CommentsController < ApplicationController
  before_action :set_params, only: %i[create]

  include CommentsHelper

  def new
  end
  
  def create
    @comment = Comment.new(user_id: current_user[:id], question_id: @comment_params[:question_id], body: @comment_params[:body])

    if @comment.save
      redirect_to(request.referrer, notice: 'Вы успешно опубликовали комментарий')
    else
      redirect_to(request.referrer, alert: @comment.errors.full_messages[0])
    end
  end

  def destroy
    Comment.delete(params[:id])

    redirect_to("/questions/#{params[:question_id]}", notice: 'Вы успешно удалили комментарий')
  end
end
