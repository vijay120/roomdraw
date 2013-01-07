class AddGroupCountToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :group_count, :integer
  end
end
