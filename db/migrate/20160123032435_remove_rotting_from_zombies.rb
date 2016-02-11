class RemoveRottingFromZombies < ActiveRecord::Migration
  def change
    remove_column :zombies, :rotting, :boolean
  end
end
