class AddFitnessTagBoolenas < ActiveRecord::Migration
  def up
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

  def down
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
  
  
  
  end
end
