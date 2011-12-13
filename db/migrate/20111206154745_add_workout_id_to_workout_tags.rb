class AddWorkoutIdToWorkoutTags < ActiveRecord::Migration
  def change
    add_column :workout_tags, :workout_id, :integer
  end
end
