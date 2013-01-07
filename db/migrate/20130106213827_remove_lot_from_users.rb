class RemoveLotFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :lot
  end

  def down
    add_column :users, :lot, :integer
  end
end
