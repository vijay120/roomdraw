class RequestRoomsController < ApplicationController
  # GET /request_rooms
  # GET /request_rooms.json
  def index
    @request_rooms = RequestRoom.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @request_rooms }
    end
  end

  # GET /request_rooms/1
  # GET /request_rooms/1.json
  def show
    @request_room = RequestRoom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @request_room }
    end
  end

  # GET /request_rooms/new
  # GET /request_rooms/new.json
  def new
    @request_room = RequestRoom.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @request_room }
    end
  end

  # GET /request_rooms/1/edit
  def edit
    @request_room = RequestRoom.find(params[:id])
  end

  # POST /request_rooms
  # POST /request_rooms.json
  def create  
    @user = User.find(session[:user_id])
    room = Room.find(params[:room_id])
    @request_room = @user.request_rooms.build(room: room)
    if Integer(params[:group]) > room.group_count
      room.group_count = room.group_count + 1
      room.save
    end
    @request_room.group = params[:group]
    @request_room.save
    respond_to do |format|
      if @request_room.save
        format.html { redirect_to @request_room.room}
        format.json { render json: @request_room, status: :created, location: @request_room }
      else
        format.html { render action: "new" }
        format.json { render json: @request_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /request_rooms/1
  # PUT /request_rooms/1.json
  def update
    @request_room = RequestRoom.find(params[:id])

    respond_to do |format|
      if @request_room.update_attributes(params[:request_room])
        format.html { redirect_to @request_room, notice: 'Request room was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @request_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_rooms/1
  # DELETE /request_rooms/1.json
  def destroy
    @request_room = RequestRoom.find(params[:id])
    group_id = @request_room.group
    @room = Room.find(@request_room.room_id)
    @all_request_rooms = RequestRoom.where(:room_id => @room, :group => group_id)
    if @all_request_rooms.count == 1
      @room.group_count -= 1
      @room.save
    end
    @request_room.destroy

    respond_to do |format|
      format.html { redirect_to @room }
      format.json { head :ok }
    end
  end
end
