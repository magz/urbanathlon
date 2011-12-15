class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :workout_id

      t.timestamps
    end
    remove :users, :favorite_workouts
    
  end
end
