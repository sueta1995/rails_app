require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'test user' do
    context 'when valid data' do
      it 'returns success' do
        User.create!(nickname: 'sueta', email: 'sueta@sueta.sueta', password: 'Aa123!', password_confirmation: 'Aa123!')
      end
    end

    context 'when invalid data' do
      it 'returns error message, question_id is null' do
        user = User.new()
        user.save
        
        expect(user.errors.full_messages[0]).to eq "Password can't be blank"
      end

      it 'returns error message, invalid nickname' do
        user = User.new(nickname: 's', email: 'sueta@sueta.sueta', password: 'Aa123!', password_confirmation: 'Aa123!')
        user.save

        expect(user.errors.full_messages[0]).to eq "Nickname should be valid"
			end

			it 'returns error message, invalid email' do
				user = User.new(nickname: 'sueta', email: 'sueta@sueta.', password: 'Aa123!', password_confirmation: 'Aa123!')
        user.save

        expect(user.errors.full_messages[0]).to eq "Email should be valid"
			end
    end
  end
end
