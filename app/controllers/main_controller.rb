# frozen_string_literal: true

# class of main controller
class MainController < ApplicationController
  def index; end

  def users
    @users = User.all
  end
end
