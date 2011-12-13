class RemovingObstacAndFitnessBooleans < ActiveRecord::Migration
  def up
    remove_column    :workouts, :fit_agility, :boolean
    remove_column    :workouts, :fit_arms_and_back, :boolean
    remove_column    :workouts, :fit_balance, :boolean
    remove_column    :workouts, :fit_cardio, :boolean
    remove_column    :workouts, :fit_core, :boolean
    remove_column    :workouts, :fit_endurance, :boolean
    remove_column    :workouts, :fit_lower_body, :boolean
    remove_column    :workouts, :fit_relaxation, :boolean
    remove_column    :workouts, :fit_speed, :boolean
    remove_column    :workouts, :fit_stability, :boolean
    remove_column    :workouts, :fit_stretch, :boolean
    remove_column    :workouts, :fit_stretching, :boolean
    remove_column    :workouts, :fit_total_body, :boolean
    remove_column    :workouts, :fit_upper_body, :boolean
    remove_column    :workouts, :fit_whole_body, :boolean
    
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

  def down
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
  
    add_column    :workouts, :fit_agility, :boolean
    add_column    :workouts, :fit_arms_and_back, :boolean
    add_column    :workouts, :fit_balance, :boolean
    add_column    :workouts, :fit_cardio, :boolean
    add_column    :workouts, :fit_core, :boolean
    add_column    :workouts, :fit_endurance, :boolean
    add_column    :workouts, :fit_lower_body, :boolean
    add_column    :workouts, :fit_relaxation, :boolean
    add_column    :workouts, :fit_speed, :boolean
    add_column    :workouts, :fit_stability, :boolean
    add_column    :workouts, :fit_stretch, :boolean
    add_column    :workouts, :fit_stretching, :boolean
    add_column    :workouts, :fit_total_body, :boolean
    add_column    :workouts, :fit_upper_body, :boolean
    add_column    :workouts, :fit_whole_body, :boolean
    
  end
end
