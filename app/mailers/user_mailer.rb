class UserMailer < ActionMailer::Base
  
  default :from => "vijay120@gmail.com"
  
  def registration_confirmation(user, secret_token)
    @user = user
    @url = "http://0.0.0.0:3000/users/#{@user.id}/edit"
    @secret_token = secret_token
    mail(:to => user.email, :subject => "Welcome to Muddraw!")
  end
    
  
end
