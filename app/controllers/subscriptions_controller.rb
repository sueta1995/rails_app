# frozen_string_literal: true

# class of subscriptions controller
class SubscriptionsController < ApplicationController
  before_action :set_params, only: %i[create destroy]

  include SubscriptionsHelper

  def new; end

  def create
    if @subscription_find.present?
      redirect_to request.path, alert: 'Вы уже подписаны на данного пользователя!'
    else
      Subscription.create(user_id: params[:id], follower_id: current_user[:id])

      redirect_to "/users/#{params[:id]}", notice: 'Вы успешно подписались!'
    end
  end

  def destroy
    @subscription_find.delete

    redirect_to "/users/#{params[:id]}", notice: 'Вы успешно отписались!'
  end

  def followings
    @sub_user_required = Subscription.where(follower_id: params[:user_id])
  end

  def followers
    @fol_user_required = Subscription.where(user_id: params[:user_id])
  end
end
