module QuestionsHelper
	def set_params
		@question_params = params.require(:question).permit(:body)
		@question_body = @question_params[:body]
	end

  def validation
		redirect_to("/users/#{current_user[:id]}", alert: 'Запись не может быть пустой') if /\A\s*\Z/.match?(@question_body)
  end

	def set_info
		@question_comments = Comment.where(question_id: params[:question_id]).reverse
	end
end
