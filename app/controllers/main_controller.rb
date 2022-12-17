# frozen_string_literal: true

# class of main controller
class MainController < ApplicationController
  include MainHelper

  def index
    return unless current_user.present?

    @following_list = current_user.followings

    create_questions_list
  end

  def users
    @users = User.all
  end

  def dialogues
    @dialogues = current_user.dialogues_first + current_user.dialogues_second
  end
end
