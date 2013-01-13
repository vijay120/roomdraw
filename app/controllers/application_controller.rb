class ApplicationController < ActionController::Base

  before_filter :authorize
  before_filter :correct_user
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

  def correct_user
    if params[:id] != session[:user_id].to_s
      redirect_to admin_url, notice: "You tried to access someone else's account!"
    end
  end
  
  private
  def current_user
    User.find_by_id(session[:user_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to login_url, notice: 'Please login'
  end
    
  
end
