class ApplicationController < ActionController::Base
  before_filter :beta_authenticate
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

  def beta_authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "frank" && password == "turnips"
    end
  end
    
  
end
