# frozen_string_literal: true

# helper for question controller
module QuestionsHelper
  def set_params
    @question_params = params.require(:question).permit(:body)
  end

  def set_info
    return unless @question_required.present?

    @question_user = @question_required.user
    @question_comments = @question_required.comments.select { |c| c.user.banned_user.nil? }.reverse
  end
end
