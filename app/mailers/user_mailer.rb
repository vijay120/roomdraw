class UserMailer < ActionMailer::Base
  
  default :from => "vijay120@gmail.com"
  
  def registration_confirmation(user)
    @user = user
    @url = "http://www.google.com"
    mail(:to => user.email, :subject => "Welcome!")
  end
    
  
end
