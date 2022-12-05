# frozen_string_literal: true

# class of main controller
class MainController < ApplicationController
  include MainHelper

  def index
    if current_user.present?
      @following_list = Subscription.where(follower_id: current_user.id)

      create_questions_list
    end
  end

  def users
    @users = User.all
  end
end
