class AddDrawNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :draw_number, :decimal
  end
end
