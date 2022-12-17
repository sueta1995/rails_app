# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'test user' do
    let(:second_user) do
      second_user = User.new(nickname: 'tagir1', email: 'tagir1@sueta.com', password: 'Aqwerty123!',
                             password_confirmation: 'Aqwerty123!')
      second_user.save!
    end

    context 'when valid data' do
      it 'returns success' do
        user = User.new(nickname: 'sueta', email: 'sueta@sueta.sueta', password: 'Aa123!',
                        password_confirmation: 'Aa123!')

        expect(user.save).to eq true
      end
    end

    context 'when invalid data' do
      it 'returns error message, question_id is null' do
        user = User.new
        user.save

        expect(user.errors.full_messages[0]).to eq "Password can't be blank"
      end

      it 'returns error message, invalid nickname' do
        user = User.new(nickname: 's', email: 'sueta@sueta.sueta', password: 'Aa123!',
                        password_confirmation: 'Aa123!')
        user.save

        expect(user.errors.full_messages[0]).to eq 'Nickname Никнейм должен быть валидным'
      end

      it 'returns error message, invalid email' do
        user = User.new(nickname: 'sueta', email: 'sueta@sueta.', password: 'Aa123!',
                        password_confirmation: 'Aa123!')
        user.save

        expect(user.errors.full_messages[0]).to eq 'Email Почта должна быть валидной'
      end

      it 'returns error message, passwod_confirmation is null' do
        user = User.new(nickname: 'sueta', email: 'sueta@sueta.sueta', password: 'Aa123!')
        user.save

        expect(user.errors.full_messages[0]).to eq 'Password confirmation Поле подтверждения пароля не может быть пустым'
      end

      it 'returns error message, exist nickname' do
        second_user

        user = User.new(nickname: 'tagir1', email: 'sueta@sueta.sueta', password: 'Aa123!',
                        password_confirmation: 'Aa123!')
        user.save

        expect(user.errors.full_messages[0]).to eq 'Nickname Данный никнейм уже занят'
      end

      it 'returns error message, exist email' do
        second_user

        user = User.new(nickname: 'sueta', email: 'tagir1@sueta.com', password: 'Aa123!',
                        password_confirmation: 'Aa123!')
        user.save

        expect(user.errors.full_messages[0]).to eq 'Email К данной почте уже привязан аккаунт'
      end
    end
  end
end
