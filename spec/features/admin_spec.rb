# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ban users', type: :feature do
  scenario 'authentication if user has been banned' do
    User.create(nickname: 'sueta', email: 'sueta@sueta.sueta', password: 'Aa123!', password_confirmation: 'Aa123!')
    User.create(nickname: 'admin', email: 'admin@admin.admin', password: 'QwE123!#', password_confirmation: 'QwE123!#')

    ban_user_id = User.find_by(nickname: 'sueta')[:id]
    admin_user_id = User.find_by(nickname: 'admin')[:id]

    AdminUser.create(user_id: admin_user_id)

    visit new_session_path

    fill_in 'session[email]', with: 'admin@admin.admin'
    fill_in 'session[password]', with: 'QwE123!#'
    click_on :commit

    visit '/bans/new'

    fill_in 'ban_user[user_id]', with: ban_user_id
    fill_in 'ban_user[reason]', with: 'Украл гуся'
    find('#ban-user-button').click

    find('#exit-button').click

    visit new_session_path

    fill_in 'session[email]', with: 'sueta@sueta.sueta'
    fill_in 'session[password]', with: 'Aa123!'
    click_on :commit

    expect(page).to have_text('Вы не можете зайти в этот аккаунт, так как он заблокирован по причине: Украл гуся!')

    fill_in 'session[email]', with: 'admin@admin.admin'
    fill_in 'session[password]', with: 'QwE123!#'
    click_on :commit

    visit '/bans/new'

    fill_in 'unban_user[user_id]', with: ban_user_id
    find('#unban-user-button').click

    find('#exit-button').click

    visit new_session_path

    fill_in 'session[email]', with: 'sueta@sueta.sueta'
    fill_in 'session[password]', with: 'Aa123!'
    click_on :commit

    expect(page).to have_text('Вы успешно зашли в аккаунт!')
  end
end
