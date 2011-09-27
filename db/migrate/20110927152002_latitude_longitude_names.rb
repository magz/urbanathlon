class LatitudeLongitudeNames < ActiveRecord::Migration
  def up
    rename_column :workouts, :lat, :latitude
    rename_column :workouts, :lng, :longitude
    add_column    :workouts, :gmaps, :boolean
  
  end

  def down
    rename_column :workouts, :latitude, :lat
    rename_column :workouts, :longitude, :lng
    remove_column :workouts, :gmaps, :boolean
  end
end
