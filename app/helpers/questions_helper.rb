module QuestionsHelper
	def set_params
		@question_params = params.require(:question).permit(:body)
		@question_body = @question_params[:body]
	end

  def validation
    redirect_to('', alert: 'Запись не может быть пустой') if @question_params[:body].empty?
  end
end
