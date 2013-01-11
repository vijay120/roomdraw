class AddAlphaToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :alpha, :string
  end
end
