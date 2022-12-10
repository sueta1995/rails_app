# frozen_string_literal: true

# helper for main controller
module MainHelper
	def create_questions_list
		@questions_list = []

		@following_list.each do |fl|
			user = User.find(fl[:user_id])

			if user.banned_user.nil?
				@questions_list += user.questions
			end
		end

		@questions_list = @questions_list.sort_by(&:created_at).reverse
	end
end
