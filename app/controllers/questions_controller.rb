class QuestionsController < ApplicationController
  before_action :set_params, only: %i[create]

  include QuestionsHelper

  def new
  end

  def create
  end

  def destroy
  end
end
