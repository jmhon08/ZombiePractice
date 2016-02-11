class CommentIdFromZombie < ActiveRecord::Migration
  def up
    remove_column :zombies, :comment_id, :integer
  end

  def down
  	add_column :zombies, :comment_id, :integer
  end
end
