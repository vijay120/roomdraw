class UserMailer < ActionMailer::Base
  
  default :from => "vijay120@gmail.com"
  
  def registration_confirmation(user, secret_token)
    @user = user
    @url = "http://ashmc.hmc.edu/"
    @secret_token = secret_token
    mail = user.email + "@hmc.edu"
    mail(:to => mail, :subject => "Welcome to Muddraw 2013!")
  end
    
end
