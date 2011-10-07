class AddDifficulty < ActiveRecord::Migration
  def up
    add_column    :workouts, :difficulty, :integer
    
  end

  def down
    remove_column    :workouts, :difficulty, :integer
    
  end
end
