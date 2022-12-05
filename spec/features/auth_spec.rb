# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user authentication', type: :feature do
  scenario 'registration and authentication' do
    User.create(nickname: 'sueta', email: 'sueta@sue.ta', password: '12345678')

    visit new_session_path

    fill_in 'session[email]', with: 'sueta@sue.ta'
    fill_in 'session[password]', with: '12345678'
    click_on :commit

    expect(page).to have_text('Вы упешно зашли в аккаунт!')

    find('#exit-button').click

    expect(page).to have_text('Вы вышли из аккаунта!')
  end
end
