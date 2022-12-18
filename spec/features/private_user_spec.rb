# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'private profiles', type: :feature do
  scenario 'checking private system working' do
    User.create(nickname: 'sueta', email: 'sueta@sueta.sueta', password: '12345678Aa!',
                password_confirmation: '12345678Aa!')
    User.create(nickname: 'kto', email: 'kto@yandex.ru', password: '!Qqwerty1234567',
                password_confirmation: '!Qqwerty1234567')

    user_following = User.find_by(nickname: 'sueta')

    visit new_session_path

    fill_in 'session[email]', with: 'sueta@sueta.sueta'
    fill_in 'session[password]', with: '12345678Aa!'
    click_on :commit

    find('#user-button').click

    fill_in 'question[body]', with: 'Очень интересная запись...'
    click_on :commit

    visit 'users/edit'

    find('#update-private-user-button').click
    find('#exit-button').click

    visit new_session_path

    fill_in 'session[email]', with: 'kto@yandex.ru'
    fill_in 'session[password]', with: '!Qqwerty1234567'
    click_on :commit

    visit "/users/#{user_following[:id]}"

    expect(page).to have_content('Подпишитесь на данного пользователя, чтобы смотреть его записи')

    find('#follow-button').click

    expect(page).to have_content('Очень интересная запись...')
  end
end
