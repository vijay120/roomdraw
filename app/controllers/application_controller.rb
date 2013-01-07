class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def destroy
    session[:user_id] = nil
    redirect_to users_url, notice: 'Logged out'
  end
    
  protected
  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, notice: 'Please login'
    end
  end
  
  private
  def current_user
    User.find_by_id(session[:user_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to login_url, notice: 'Please login'
  end
    
  
end
