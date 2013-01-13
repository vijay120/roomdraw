class DormController < ApplicationController

  skip_before_filter :authorize
  skip_before_filter :correct_user



  def north
    @first_floor = Room.where("name = 'North' AND floor = 1")
    @second_floor = Room.where("name = 'North' AND floor = 2")
  end

  def south
    @first_floor = Room.where("name = 'South' AND floor = 1")
    @second_floor = Room.where("name = 'South' AND floor = 2")
  end

  def east
    @first_floor = Room.where("name = 'East' AND floor = 1")
    @second_floor = Room.where("name = 'East' AND floor = 2")  
  end

  def west
    @first_floor = Room.where("name = 'West' AND floor = 1")
    @second_floor = Room.where("name = 'West' AND floor = 2")
  end

  def atwood
    @first_floor = Room.where("name = 'Atwood' AND floor = 1")
    @second_floor = Room.where("name = 'Atwood' AND floor = 2")
    @third_floor = Room.where("name = 'Atwood' AND floor = 3")
  end

  def sontag
    @first_floor = Room.where("name = 'Sontag' AND floor = 1")
    @second_floor = Room.where("name = 'Sontag' AND floor = 2") 
    @third_floor =  Room.where("name = 'Sontag' AND floor = 3") 
  end

  def linde
    @first_floor = Room.where("name = 'Linde' AND floor = 1")
    @second_floor = Room.where("name = 'Linde' AND floor = 2")
  end

  def case
    @first_floor = Room.where("name = 'Case' AND floor = 1")
    @second_floor = Room.where("name = 'Case' AND floor = 2")
  end

end
