class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_code.subject
  #
  def send_code
    @user = params[:user]
    @code = params[:code]
    @greeting = "Привет, #{@user[:nickname]}"

    mail(
      to: @user[:email],
      subject: "Проверочный код для регистрации: #{@code}"
    )
  end
end
