class UsersController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create, :index, :destroy]
  skip_before_filter :correct_user, only: [:new, :create, :index, :destroy]
  before_filter :authenticate, only: [:index]
  #skip_before_filter :authorize
  #skip_before_filter :correct_user

  # GET /users
  # GET /users.json
  def index
    @users = User.order(:name)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
    secret_token  =  (0...15).map{ o[rand(o.length)] }.join
    @user.password = secret_token
    @user.password_confirmation = secret_token
    respond_to do |format|
      if @user.save
        UserMailer.registration_confirmation(@user, secret_token).deliver
        format.html { redirect_to admin_url, notice: "Hello #{@user.name}! Log into your mudd email to receive your temporary password." }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to admin_url, notice: "Your account was successfully updated." }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "muddadmin" && password = "annakendrickishot"
    end
  end

end
