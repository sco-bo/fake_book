class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user 
    @url = 'http://localhost:3000'
    mail(to: @user.email, subject: "Welcome to fakebook")
  end
end
