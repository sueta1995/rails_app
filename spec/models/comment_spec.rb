# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'test comments' do
    let(:user) do
      user = User.new(nickname: 'tagir1', email: 'tagir1@sueta.com', password: 'Aqwerty123!',
                      password_confirmation: 'Aqwerty123!')
      user.save!
      user
    end
    let(:question) do
      question = Question.new(user_id: user[:id], body: 'Привет')
      question.save!
      question
    end

    context 'when valid data' do
      it 'returns success' do
        Comment.create!(user_id: user[:id], question_id: question[:id], body: 'Пока')
      end
    end

    context 'when invalid data' do
      it 'returns error message, question_id is null' do
        comment = Comment.new(user_id: user[:id])
        comment.save

        expect(comment.errors.full_messages[0]).to eq 'Question must exist'
      end

      it 'returns error message, user_id is null' do
        comment = Comment.new(question_id: question[:id])
        comment.save

        expect(comment.errors.full_messages[0]).to eq 'User must exist'
      end

      it 'returns error message, body is null' do
        comment = Comment.new(user_id: user[:id], question_id: question[:id])
        comment.save

        expect(comment.errors.full_messages[0]).to eq 'Body Тело комментария не может быть пустым'
      end
    end
  end
end
