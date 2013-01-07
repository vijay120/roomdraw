class CreateRequestRooms < ActiveRecord::Migration
  def change
    create_table :request_rooms do |t|
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
