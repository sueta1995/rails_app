class SubscriptionsController < ApplicationController
  def new
  end

  def create
    if Subscription.find_by(user_id: params[:id], follower_id: current_user[:id]).present?
      redirect_to request.path, alert: "Вы уже подписаны на данного пользователя!"
    else
      Subscription.create(user_id: params[:id], follower_id: current_user[:id])

      redirect_to "/users/#{params[:id]}", notice: "Вы успешно подписались!"
    end
  end

  def destroy
    Subscription.find_by(user_id: params[:id], follower_id: current_user[:id]).delete

    redirect_to "/users/#{params[:id]}", notice: "Вы успешно отписались!"
  end

  def followings
    @sub_user_required = Subscription.where(follower_id: params[:user_id])
  end

  def followers
    @fol_user_required = Subscription.where(user_id: params[:user_id])
  end
end
