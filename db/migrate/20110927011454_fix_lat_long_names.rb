class FixLatLongNames < ActiveRecord::Migration
  def up
    rename_column :workouts, :xcoord, :lat
    rename_column :workouts, :ycoord, :lng
  end

  def down
    rename_column :workouts, :lat, :xcoord
    rename_column :workouts, :lng, :ycoord
    
  end
end
