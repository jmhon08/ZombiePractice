class AddZombieIdToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :zombie_id, :integer
  end
end
