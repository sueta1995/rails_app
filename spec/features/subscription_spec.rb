# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'subscription', type: :feature do
  scenario 'authentication and subscription for another user' do
    User.create(nickname: 'tagir3', email: 'tagir3@sueta.com', password: 'Qqwerty123$', password_confirmation: 'Qqwerty123$')
    User.create(nickname: 'sueta', email: 'sueta@tagir.com', password: '12345678qweQWE@', password_confirmation: '12345678qweQWE@')

    user_id_following = User.find_by(nickname: 'sueta')[:id]
    user_id_follower = User.find_by(nickname: 'tagir3')[:id]

    visit new_session_path

    fill_in 'session[email]', with: 'tagir3@sueta.com'
    fill_in 'session[password]', with: 'Qqwerty123$'
    click_on :commit

    expect(page).to have_text('Вы успешно зашли в аккаунт!')

    visit "/users/#{user_id_following}"

    find('#follow-button').click

    expect(page).to have_text('Вы успешно подписались!')
    expect(Subscription.find_by(user_id: user_id_following, follower_id: user_id_follower).present?).to eq true

    find('#followers-list-link').click

    expect(page).to have_text('tagir')

    visit "/users/#{user_id_follower}"

    find('#followings-list-link').click

    expect(page).to have_text('sueta')
  end
end
