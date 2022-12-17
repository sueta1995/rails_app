# frozen_string_literal: true

# helper for question controller
module QuestionsHelper
  def set_params
    @question_params = params.require(:question).permit(:body)
  end

  def set_info
    return unless @question_required.present?

    @question_user = @question_required.user
    @question_comments = @question_required.comments.select do |c|
      c.user.banned_user.nil? && c.user.shadowbanned_user.nil? || c.user == current_user
    end.reverse
    @question_user_banned = @question_user.banned_user.present?
    @question_user_shadowbanned = @question_user.shadowbanned_user.present?
    @can_check = @question_user.followers.find_by(follower_id: current_user.id) || current_user == @question_user
  end
end
