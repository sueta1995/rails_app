module CommentsHelper
	def set_params
		@comment_params = params.require(:comment).permit(:body, :question_id)
		@comment_body = @comment_params[:body]
	end

	def validation
		redirect_to(root_path, alert: 'Невозможно оставить комментарий') and return if @comment_params[:question_id].nil?
		redirect_to("/questions/#{@comment_params[:question_id]}", alert: 'Комментарий не может быть пустым') and return if /\A\s*\Z/.match?(@comment_body) 
	end
end
