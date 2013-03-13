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
      @user = User.find(session[:user_id])
    rescue ActiveRecord::RecordNotFound
    @user = nil
    end

      @room = Room.find(params[:id]) 
      room_to_size_conversion = {'s' => 1, 'd' => 2, 't' => 3, 'q' => 4}
      @capacity = room_to_size_conversion[@room.size]
      
      @group_array = Array.new
      @user_array = Array.new
      @subquent_array = Array.new
            
      @group_to_users = Hash.new
      @group_to_priorities = Hash.new
      RequestRoom.where(:room_id => @room).each do |each_req|
        gid = each_req.group
        #Add users with the same group id into same bucket of gid
        if !@group_to_users.has_key?(gid)
          @group_to_users[gid] = [User.find(each_req.user_id)]
        else
          @group_to_users[gid] << User.find(each_req.user_id)
        end

        if !@group_to_priorities.has_key?(gid)
          @group_to_priorities[gid] = each_req.priority
        else
          @group_to_priorities[gid] += each_req.priority
        end

        id = each_req.group
        @subquent_array.push(id)
      end

      @keys_of_group_to_users = @group_to_users.keys
      @potential_group_id = Array.new
      potential_free_slot = Array(1..@keys_of_group_to_users.size+1)
      @keys_of_group_to_users.each do |gid|
        if @group_to_users[gid].size() < @capacity
          @potential_group_id << [gid.to_s(), gid]
        end
        potential_free_slot.delete(gid)
      end
      @potential_group_id << ['Make new group', potential_free_slot[0]]
      
  if !@user.nil?
      @user_rooms = @user.rooms.exists?(@room)
      @user_priority = [1,2,3,4,5]
      RequestRoom.where(:user_id => @user).each do |j|
        @user_priority.delete(j.priority)
      end
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
