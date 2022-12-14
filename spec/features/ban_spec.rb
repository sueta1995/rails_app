# frozen_string_literal: true

require 'rails_helper'

# Созданный пользователь добавляется в таблицу забаненных пользователей.
# Проверяется невозможность входа этого пользователя.
RSpec.describe 'ban users', type: :feature do
  scenario 'authentication if user has been banned' do
    User.create(nickname: 'sueta', email: 'sueta@sueta.sueta', password: 'Aa123!', password_confirmation: 'Aa123!')

    user_id = User.find_by(nickname: 'sueta')[:id]

    BannedUser.create(user_id: user_id, reason: 'Украл гуся')

    visit new_session_path

    fill_in 'session[email]', with: 'sueta@sueta.sueta'
    fill_in 'session[password]', with: 'Aa123!'
    click_on :commit

    expect(page).to have_text('Вы не можете зайти в этот аккаунт, так как он заблокирован по причине: Украл гуся!')
  end
end
