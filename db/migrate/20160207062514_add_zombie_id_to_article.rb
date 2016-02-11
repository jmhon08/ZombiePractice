class AddZombieIdToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :zombie_id, :integer
  end
end
