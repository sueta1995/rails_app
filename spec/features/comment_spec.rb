# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'questions', type: :feature do
  scenario 'creating new questions' do
    User.create(nickname: 'sueta', email: 'sueta@sueta.sueta', password: 'QQQaaa12345678#',
                password_confirmation: 'QQQaaa12345678#')

    user_id = User.find_by(nickname: 'sueta')[:id]

    visit new_session_path

    fill_in 'session[email]', with: 'sueta@sueta.sueta'
    fill_in 'session[password]', with: 'QQQaaa12345678#'
    click_on :commit

    expect(page).to have_text('Вы успешно зашли в аккаунт!')

    find('#user-button').click

    fill_in 'question[body]', with: 'Всем привет!'
    click_on :commit

    expect(Question.find_by(user_id: user_id, body: 'Всем привет!').present?).to eq true
    expect(page).to have_text('Вы успешно опубликовали запись')
    expect(page).to have_text('Всем привет!')

    question_id = Question.find_by(user_id: user_id)[:id]

    visit "/questions/#{question_id}"

    fill_in 'comment[body]', with: 'Комментарий'
    click_on :commit

    expect(page).to have_text('Вы успешно опубликовали комментарий')
    expect(page).to have_text('Комментарий')
  end
end
