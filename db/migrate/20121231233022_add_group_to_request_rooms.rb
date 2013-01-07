class AddGroupToRequestRooms < ActiveRecord::Migration
  def change
    add_column :request_rooms, :group, :integer
  end
end
