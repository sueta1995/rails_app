require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  describe 'test admin users' do

    let(:user) {
      user = User.new(nickname: 'tagir1', email: 'tagir1@sueta.com', password: 'Aqwerty123!', password_confirmation: 'Aqwerty123!')
      user.save!
      user
    }

    context 'when valid data' do
      it 'returns success' do
        AdminUser.create!(user_id: user[:id])
      end
    end

    context 'when invalid data' do
      it 'returns error message, user must exists' do
        admin = AdminUser.new(user_id: 1234)
        admin.save
        
        expect(admin.errors.full_messages[0]).to eq "User must exist"
      end

      it 'returns error message, nil user_id' do
        admin = AdminUser.new()
        admin.save
        
        expect(admin.errors.full_messages[0]).to eq "User must exist"
      end
    end
  end
end
