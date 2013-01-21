class DormController < ApplicationController

  skip_before_filter :authorize
  skip_before_filter :correct_user

  def show
    dorm_level_lookup = { "atwood" => 3, "north" => 2, "case" => 3, "sontag" => 2, "linde" => 2, "south" => 2,"east" => 2, "west" => 2, "north" => 2}
    @dorm_levels = dorm_level_lookup[params[:id]] 
    @dorm_name = params[:id]
    @dorm_level_rooms = Hash.new
    for i in 1..@dorm_levels
      @dorm_level_rooms[i] = Room.where("name = '#{@dorm_name.capitalize}' AND floor = #{i}")
    end
  end

end
