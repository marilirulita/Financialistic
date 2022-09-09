class WelcomeMailer < ApplicationMailer
  def welcome_send(user)
    @user = user
   # mail(to: @user.email, subject: 'Welcome to the Move Tracker!')
    mail to: @user.email, subject: 'Welcome to the Move Tracker!', from: 'no-reply-financialistic-app@outlook.com'
  end
end
