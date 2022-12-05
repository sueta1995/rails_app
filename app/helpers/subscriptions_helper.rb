# frozen_string_literal: true

# helper for subscriptions controller
module SubscriptionsHelper
  def set_params
    @subscription_find = Subscription.find_by(user_id: params[:id], follower_id: current_user[:id])
  end
end
