# frozen_string_literal: true

require 'rails_helper'

# Создается два пользователя, один из которых создает запись, а второй подписывается на первого.
# Проверяется правильность отображения в ленте записей первого пользователя записи второго.
RSpec.describe 'list of questions at main#index', type: :feature do
  scenario 'follow another user, who post quetstion, and getting that at main#index' do
    User.create(nickname: 'sueta', email: 'sueta@sueta.sueta', password: '12345678Aa!',
                password_confirmation: '12345678Aa!')
    User.create(nickname: 'kto', email: 'kto@yandex.ru', password: '!Qqwerty1234567',
                password_confirmation: '!Qqwerty1234567')

    user_id_following = User.find_by(nickname: 'sueta')[:id]

    visit new_session_path

    fill_in 'session[email]', with: 'sueta@sueta.sueta'
    fill_in 'session[password]', with: '12345678Aa!'
    click_on :commit

    find('#user-button').click

    fill_in 'question[body]', with: 'Очень интересная запись...'
    click_on :commit

    find('#exit-button').click

    visit new_session_path

    fill_in 'session[email]', with: 'kto@yandex.ru'
    fill_in 'session[password]', with: '!Qqwerty1234567'
    click_on :commit

    visit "/users/#{user_id_following}"

    find('#follow-button').click

    visit '/'

    expect(page).to have_content('Очень интересная запись...')
  end
end
