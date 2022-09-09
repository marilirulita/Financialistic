class WelcomeMailer < ApplicationMailer
  def welcome_send(user)
    @user = user
   # mail(to: @user.email, subject: 'Welcome to the Move Tracker!')
    mail to: @user.email, subject: 'Welcome to the Move Tracker!', from: 'example@email.com'
  end
end
