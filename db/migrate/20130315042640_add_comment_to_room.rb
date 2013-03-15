class AddCommentToRoom < ActiveRecord::Migration
  def change
    add_column :rooms, :comment, :text
  end
end
