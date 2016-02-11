class DropCommentIdFromArticle < ActiveRecord::Migration
  def up
    remove_column :articles, :comment_id, :integer
  end

  def down
  	add_column :articles, :comment_id, :integer
  end
end
