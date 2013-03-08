class AddPriorityToRequestRooms < ActiveRecord::Migration
  def change
    add_column :request_rooms, :priority, :integer
  end
end
