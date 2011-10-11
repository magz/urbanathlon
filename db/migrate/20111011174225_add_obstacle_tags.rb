class AddObstacleTags < ActiveRecord::Migration
  def up
    add_column    :workouts, :obstac_balance_beam, :boolean
    add_column    :workouts, :obstac_ball_fields, :boolean
    add_column    :workouts, :obstac_barricade, :boolean
    add_column    :workouts, :obstac_bars, :boolean
    add_column    :workouts, :obstac_beach, :boolean
    add_column    :workouts, :obstac_bench, :boolean
    add_column    :workouts, :obstac_bike_rack, :boolean
    add_column    :workouts, :obstac_concrete_ledge, :boolean
    add_column    :workouts, :obstac_court, :boolean
    add_column    :workouts, :obstac_field, :boolean
    add_column    :workouts, :obstac_fountain_edge, :boolean
    add_column    :workouts, :obstac_grass_field, :boolean
    add_column    :workouts, :obstac_hill, :boolean
    add_column    :workouts, :obstac_hurdles, :boolean
    add_column    :workouts, :obstac_outdoor_gym, :boolean
    add_column    :workouts, :obstac_park, :boolean
    add_column    :workouts, :obstac_picnic_benches, :boolean
    add_column    :workouts, :obstac_playground, :boolean
    add_column    :workouts, :obstac_pullup_bar, :boolean
    add_column    :workouts, :obstac_sand_dunes, :boolean
    add_column    :workouts, :obstac_stadium_steps, :boolean
    add_column    :workouts, :obstac_stairs, :boolean
    add_column    :workouts, :obstac_track, :boolean
    add_column    :workouts, :obstac_trail, :boolean
    
    
    
  end

  def down
    remove_column    :workouts, :obstac_balance_beam, :boolean
    remove_column    :workouts, :obstac_ball_fields, :boolean
    remove_column    :workouts, :obstac_barricade, :boolean
    remove_column    :workouts, :obstac_bars, :boolean
    remove_column    :workouts, :obstac_beach, :boolean
    remove_column    :workouts, :obstac_bench, :boolean
    remove_column    :workouts, :obstac_bike_rack, :boolean
    remove_column    :workouts, :obstac_concrete_ledge, :boolean
    remove_column    :workouts, :obstac_court, :boolean
    remove_column    :workouts, :obstac_field, :boolean
    remove_column    :workouts, :obstac_fountain_edge, :boolean
    remove_column    :workouts, :obstac_grass_field, :boolean
    remove_column    :workouts, :obstac_hill, :boolean
    remove_column    :workouts, :obstac_hurdles, :boolean
    remove_column    :workouts, :obstac_outdoor_gym, :boolean
    remove_column    :workouts, :obstac_park, :boolean
    remove_column    :workouts, :obstac_picnic_benches, :boolean
    remove_column    :workouts, :obstac_playground, :boolean
    remove_column    :workouts, :obstac_pullup_bar, :boolean
    remove_column    :workouts, :obstac_sand_dunes, :boolean
    remove_column    :workouts, :obstac_stadium_steps, :boolean
    remove_column    :workouts, :obstac_stairs, :boolean
    remove_column    :workouts, :obstac_track, :boolean
    remove_column    :workouts, :obstac_trail, :boolean
    
  end
end
