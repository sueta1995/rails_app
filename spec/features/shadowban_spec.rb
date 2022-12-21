# frozen_string_literal: true

require 'rails_helper'

# Создаются два пользователя. Первый получает теневую блокировку и создает.
# Проверяется невозможность просмотра записи вторым пользователем.
RSpec.describe 'shadowban users', type: :feature do
  scenario 'new questions if user has been shadowbanned' do
    User.create(nickname: 'sueta1', email: 'sueta1@sueta.sueta', password: 'Aa123!', password_confirmation: 'Aa123!')
    User.create(nickname: 'tagir1', email: 'tagir1@sueta.sueta', password: 'Aa123!', password_confirmation: 'Aa123!')

    shadowban_user_id = User.find_by(nickname: 'sueta1')[:id]

    ShadowbannedUser.create(user_id: shadowban_user_id)

    visit new_session_path

    fill_in 'session[email]', with: 'sueta1@sueta.sueta'
    fill_in 'session[password]', with: 'Aa123!'
    click_on :commit

    find('#user-button').click

    fill_in 'question[body]', with: 'Hello World'
    click_on :commit

    find('#exit-button').click

    visit new_session_path

    fill_in 'session[email]', with: 'tagir1@sueta.sueta'
    fill_in 'session[password]', with: 'Aa123!'
    click_on :commit

    visit "/users/#{shadowban_user_id}"

    expect(page).to have_text('Записей еще нет...')
  end
end
