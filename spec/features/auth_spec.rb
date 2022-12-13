# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user authentication', type: :feature do
  scenario 'registration and authentication' do
    User.create(nickname: 'sueta', email: 'sueta@sueta.sueta', password: 'Aa123!', password_confirmation: 'Aa123!')

    visit new_session_path

    fill_in 'session[email]', with: 'sueta@sueta.sueta'
    fill_in 'session[password]', with: 'Aa123!'
    click_on :commit

    expect(page).to have_text('Вы успешно зашли в аккаунт!')

    find('#exit-button').click

    expect(page).to have_text('Вы вышли из аккаунта!')
  end
end
