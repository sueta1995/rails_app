require 'rails_helper'

RSpec.describe ShadowbannedUser, type: :model do
  describe 'test shadowbanned users' do

    let(:user) {
      user = User.new(nickname: 'tagir1', email: 'tagir1@sueta.com', password: 'Aqwerty123!', password_confirmation: 'Aqwerty123!')
      user.save!
      user
    }

    context 'when valid data' do
      it 'returns success' do
        ShadowbannedUser.create!(user_id: user[:id])
      end
    end

    context 'when invalid data' do
      it 'returns error message, user must exists' do
        shadowban = ShadowbannedUser.new(user_id: 1234)
        shadowban.save
        
        expect(shadowban.errors.full_messages[0]).to eq "User must exist"
      end

      it 'returns error message, nil user_id' do
        shadowban = ShadowbannedUser.new()
        shadowban.save
        
        expect(shadowban.errors.full_messages[0]).to eq "User must exist"
      end
    end
  end
end
