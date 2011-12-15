class AddFavoritesSerializationToUser < ActiveRecord::Migration
  def up
    add_column :users, :favorite_workouts, :text
  end
  def down
    remove :users, :favorite_workouts
  end
    
end
