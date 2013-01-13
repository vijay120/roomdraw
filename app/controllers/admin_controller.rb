class AdminController < ApplicationController
  
  skip_before_filter :authorize
  skip_before_filter :correct_user

  def index
    @user = User.find(session[:user_id])
    rescue ActiveRecord::RecordNotFound
      @user = nil
    
    
    @total_users = User.count
  end

end
