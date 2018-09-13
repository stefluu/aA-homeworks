class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'

  def welcome_email(user)
    @user = user
    @url = 'http://thisismywebsite.com/login'
    mail(to: user.email, subject: 'Welcome to this Ambiguous Site!:)')
  end
end
