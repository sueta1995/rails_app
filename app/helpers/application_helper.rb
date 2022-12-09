# frozen_string_literal: true

# helper for application controller
module ApplicationHelper
	def comments_count(id)
    Comment.where(question_id: id).count
  end
end
