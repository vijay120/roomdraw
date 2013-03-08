class AddLockedToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :locked, :boolean
  end
end
