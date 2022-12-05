# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ban users', type: :feature do
  scenario 'authentication if user has been banned' do
    User.create(nickname: 'sueta', email: 'sueta@sue.ta', password: '12345678')

    user_id = User.find_by(nickname: 'sueta')[:id]

    BannedUser.create(user_id: user_id, reason: 'Украл гуся')

    visit new_session_path

    fill_in 'session[email]', with: 'sueta@sue.ta'
    fill_in 'session[password]', with: '12345678'
    click_on :commit

    expect(page).to have_text('Вы не можете зайти в этот аккаунт, так как он заблокирован по причине: Украл гуся!')
  end
end
