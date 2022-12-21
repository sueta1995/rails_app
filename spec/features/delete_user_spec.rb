# frozen_string_literal: true

require 'rails_helper'

# Проверка отсутствия в таблице пользователя, который удалил свой аккаунт
RSpec.describe 'delete exists user', type: :feature do
  scenario 'authentication and deletion' do
    User.create(nickname: 'tagir', email: 'tagir@sueta.com', password: 'Aqwerty123!',
                password_confirmation: 'Aqwerty123!')

    visit new_session_path

    fill_in 'session[email]', with: 'tagir@sueta.com'
    fill_in 'session[password]', with: 'Aqwerty123!'
    click_on :commit

    expect(page).to have_text('Вы успешно зашли в аккаунт!')

    find('#user-button').click
    find('#delete-user-button').click

    expect(page).to have_text('Аккаунт удален!')
    expect(User.find_by(nickname: 'tagir').present?).to eq false
  end
end
