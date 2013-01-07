class AddSizeColumnToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :size, :string
  end
end
