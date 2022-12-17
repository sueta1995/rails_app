# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'test questions' do
    let(:user) do
      user = User.new(nickname: 'tagir1', email: 'tagir1@sueta.com', password: 'Aqwerty123!',
                      password_confirmation: 'Aqwerty123!')
      user.save!
      user
    end

    context 'when valid data' do
      it 'returns success' do
        Question.create!(user_id: user[:id], body: 'Привет')
      end
    end

    context 'when invalid data' do
      it 'returns error message, question_id is null' do
        question = Question.new(user_id: user[:id])
        question.save

        expect(question.errors.full_messages[0]).to eq 'Body Тело записи не может быть пустым'
      end

      it 'returns error message, user_id is null' do
        question = Question.new(body: 'hello')
        question.save

        expect(question.errors.full_messages[0]).to eq 'User must exist'
      end
    end
  end
end
