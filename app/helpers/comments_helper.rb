module CommentsHelper
	def set_params
		@comment_params = params.require(:comment).permit(:body, :question_id)
	end
end
