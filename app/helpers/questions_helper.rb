module QuestionsHelper
	def set_params
		@question_params = params.require(:question).permit(:body)
	end

	def set_info
		@question_comments = Comment.where(question_id: params[:question_id]).reverse
	end
end
