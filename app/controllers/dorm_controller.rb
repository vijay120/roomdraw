class DormController < ApplicationController
  def north
    @rooms = Room.where("name = 'North'")
  end

  def south
    @rooms = Room.where("name = 'South'")
  end

  def east
    @rooms = Room.where("name = 'East'")
  end

  def west
    @rooms = Room.where("name = 'West'")
  end

  def atwood
    @rooms = Room.where("name = 'Atwood'")
  end

  def sontag
    @rooms = Room.where("name = 'Sontag'")
  end

  def linde
    @rooms = Room.where("name = 'Linde'")
  end

  def case
    @rooms = Room.where("name = 'Case'")
  end

end
