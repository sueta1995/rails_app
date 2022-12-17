require 'rails_helper'

RSpec.describe BannedUser, type: :model do
  describe 'test banned users' do

    let(:user) {
      user = User.new(nickname: 'tagir1', email: 'tagir1@sueta.com', password: 'Aqwerty123!', password_confirmation: 'Aqwerty123!')
      user.save!
      user
    }

    context 'when valid data' do
      it 'returns success' do
        BannedUser.create!(user_id: user[:id], reason: 'reason')
      end
    end

    context 'when invalid data' do
      it 'returns error message, user must exists' do
        ban = BannedUser.new(user_id: 1234)
        ban.save
        
        expect(ban.errors.full_messages[0]).to eq "User must exist"
      end

      it 'returns error message, nil user_id' do
        ban = BannedUser.new()
        ban.save
        
        expect(ban.errors.full_messages[0]).to eq "User must exist"
      end

      it 'returns error message, nil reason' do
        ban = BannedUser.new(user_id: user[:id])
        ban.save

        expect(ban.errors.full_messages[0]).to eq "Reason Причина не может быть пустой"
      end
    end
  end
end
