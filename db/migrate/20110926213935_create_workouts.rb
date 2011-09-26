class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.text :description
      t.float :xcoord
      t.float :ycoord
      t.boolean :flagged

      t.timestamps
    end
  end
end
