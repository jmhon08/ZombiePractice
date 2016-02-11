class AddCommentRefToArticles < ActiveRecord::Migration
  def change
    add_reference :articles, :comment, index: true, foreign_key: true
  end
end
