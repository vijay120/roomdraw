class SessionController < ApplicationController
  skip_before_filter :authorize
  skip_before_filter :correct_user

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: 'Invalid Username/Password combination'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to admin_url, notice: 'Logged out'
  end

end
