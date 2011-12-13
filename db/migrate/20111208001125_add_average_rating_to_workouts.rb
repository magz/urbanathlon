class AddAverageRatingToWorkouts < ActiveRecord::Migration
  def up
    add_column :workouts, :average_rating, :integer
  end

  def down
    remove_column :workouts, :average_rating
  end
end
