class RoomsController < ApplicationController
  skip_before_filter :authorize
  skip_before_filter :correct_user


  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rooms }
    end
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
            
    begin
      @room = Room.find(params[:id]) 
      
      if @room.size == 's'
        @capacity = 1
      elsif @room.size == 'd'
        @capacity = 2
      elsif @room.size == 't'
        @capacity = 3
      elsif @room.size == 'q'
        @capatity = 4
      end

      @group_array = Array.new
      @user_array = Array.new
      @subquent_array = Array.new
            
     RequestRoom.where(:room_id => @room).each do |each_req|
        id = each_req.group
        @subquent_array.push(id)
      end
        
      @subquent_array = @subquent_array.sort.uniq
      i = 1
      @subquent_array.each do |group_id|        
        @groupid_array = Array.new
        @groupid_array.push(group_id.to_s)
        RequestRoom.where(:room_id => @room, :group => group_id).each do |req|
          @temp_user = User.find(req.user_id)
          @groupid_array.push(@temp_user)
        end 
        @user_array.push(@groupid_array)
        
        if @groupid_array.count < @capacity+1
          @group_array.push [group_id.to_s(), group_id]
        end
        
        i+=1
      end
          
       j = 1
       loop do
         break if !@subquent_array.include?(j)
         j+=1
       end
          
      @group_array.push ['Make new group', j]
      
      @user = User.find(session[:user_id])
  rescue ActiveRecord::RecordNotFound
    @user = nil
  end
    if !@user.nil?
      @user_rooms = @user.rooms.exists?(@room)
      @request_room = RequestRoom.where(:user_id => @user, :room_id => @room).first
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @room }
    end
  end

  # GET /rooms/new
  # GET /rooms/new.json
  def new
    @room = Room.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @room }
    end
  end

  # GET /rooms/1/edit
  def edit
    @room = Room.find(params[:id])
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(params[:room])
    @room.group_count = 0
    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render json: @room, status: :created, location: @room }
      else
        format.html { render action: "new" }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rooms/1
  # PUT /rooms/1.json
  def update
    @room = Room.find(params[:id])

    respond_to do |format|
      if @room.update_attributes(params[:room])
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    respond_to do |format|
      format.html { redirect_to rooms_url }
      format.json { head :ok }
    end
  end
end
