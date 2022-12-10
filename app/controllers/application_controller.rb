# frozen_string_literal: true

# class of application controller
class ApplicationController < ActionController::Base
  helper_method :current_user

  before_action :check_ban

  include ApplicationHelper

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def check_ban
    return unless current_user.present?
    return unless current_user.banned_user.present?

    session.delete(:user_id)

    redirect_to(root_path, alert: 'Вас заблокировали!')
  end
end
