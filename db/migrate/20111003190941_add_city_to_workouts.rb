class AddCityToWorkouts < ActiveRecord::Migration
  def up
    
    add_column    :workouts, :city, :string
    add_column    :workouts, :zipcode, :integer
  end

  def down
   
    remove_column :workouts, :city, :string
    remove_column :workouts, :zipcode, :integer
  end
end
