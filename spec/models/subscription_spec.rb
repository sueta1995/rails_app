# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'test subscriptions' do
    let(:first_user) do
      user = User.new(nickname: 'tagir1', email: 'tagir1@sueta.com', password: 'Aqwerty123!',
                      password_confirmation: 'Aqwerty123!')
      user.save!
      user
    end

    let(:second_user) do
      user = User.new(nickname: 'sueta', email: 'sueta@sueta.sueta', password: 'Aa123!',
                      password_confirmation: 'Aa123!')
      user.save!
      user
    end

    context 'when valid data' do
      it 'returns success' do
        Subscription.create!(user_id: first_user[:id], follower_id: second_user[:id])
      end
    end

    context 'when invalid data' do
      it 'returns error message, user must exists' do
        subscription = Subscription.new
        subscription.save

        expect(subscription.errors.full_messages[0]).to eq 'User must exist'
      end

      it 'returns error message, user_id is nil' do
        subscription = Subscription.new(follower_id: second_user[:id])
        subscription.save

        expect(subscription.errors.full_messages[0]).to eq 'User must exist'
      end

      it 'returns error message, follower_id is nil' do
        subscription = Subscription.new(user_id: first_user[:id])
        subscription.save

        expect(subscription.errors.full_messages[0]).to eq 'Follower Идентификатор подписчика не может быть пустым'
      end
    end
  end
end
