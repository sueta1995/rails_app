# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'delete exists user', type: :feature do
  scenario 'authentication and deletion' do
    User.create(nickname: 'tagir', email: 'tagir@sueta.com', password: 'qwerty')

    visit new_session_path

    fill_in 'session[email]', with: 'tagir@sueta.com'
    fill_in 'session[password]', with: 'qwerty'
    click_on :commit

    expect(page).to have_text('Вы упешно зашли в аккаунт!')

    find('#user-button').click
    find('#delete-user-button').click

    expect(page).to have_text('Аккаунт удален!')
    expect(User.find_by(nickname: 'tagir').present?).to eq false
  end
end
