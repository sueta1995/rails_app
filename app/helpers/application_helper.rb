# frozen_string_literal: true

# helper for application controller
module ApplicationHelper
  def comments_count(id)
    Comment.where(question_id: id).count
  end

  def error_msg_user(user)
    nickname_e = user.errors.messages_for(:nickname)
    email_e = user.errors.messages_for(:email)
    password_e = user.errors.messages_for(:password)
    password_confirmation_e = user.errors.messages_for(:password_confirmation)

    find_rus(nickname_e + email_e + password_e + password_confirmation_e)
  end

  def error_msg_question(question)
    user_id_e = question.errors.messages_for(:user_id)
    body_e = question.errors.messages_for(:body)

    find_rus(user_id_e + body_e)
  end

  def error_msg_comment(comment)
    user_id_e = comment.errors.messages_for(:user_id)
    question_id_e = comment.errors.messages_for(:question_id)
    body_id_e = comment.errors.messages_for(:body)

    find_rus(user_id_e + question_id_e + body_id_e)
  end

  def error_msg_banned_user(banned_user)
    user_id_e = banned_user.errors.messages_for(:user_id)
    reason_e = banned_user.errors.messages_for(:reason)

    find_rus(user_id_e + reason_e)
  end

  def error_msg_shadowbanned_user(shadowbanned_user)
    user_id_e = shadowbanned_user.errors.messages_for(:user_id)

    find_rus(user_id_e)
  end

  def find_rus(array)
    array.join(', ').split(' ').select { |x| /[ а-яА-Я]/.match(x) }.join(' ')
  end
end
