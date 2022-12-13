# frozen_string_literal: true

# helper for main controller
module MainHelper
  def create_questions_list
    @questions_list = []

    @following_list.each do |fl|
      user = User.find(fl[:user_id])

      @questions_list += user.questions if user.banned_user.nil?
    end

    @questions_list = @questions_list.sort_by(&:created_at).reverse
  end
end
