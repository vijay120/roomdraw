class AdminController < ApplicationController
  
  def index
    @user = User.find(session[:user_id])
    rescue ActiveRecord::RecordNotFound
      @user = nil
    
    
    @total_users = User.count
  end

end
