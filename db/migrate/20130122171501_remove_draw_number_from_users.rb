class RemoveDrawNumberFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :draw_number
  end

  def down
    add_column :users, :draw_number, :integer
  end
end
