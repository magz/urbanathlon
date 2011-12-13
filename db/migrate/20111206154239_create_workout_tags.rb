class CreateWorkoutTags < ActiveRecord::Migration
  def change
    create_table :workout_tags do |t|
      t.string :category
      t.string :name

      t.timestamps
    end
  end
end
