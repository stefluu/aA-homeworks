class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'

  def welcome_email(user)
    @user = user
    @url = 'http://thisismywebsite.com/login'
    mail(to: 'luu.stefanie@gmail.com', subject: 'Welcome to this Ambiguous Site!:)')
  end
end
