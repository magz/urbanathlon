class UserCreated < ActiveRecord::Migration
  def up
    add_column    :workouts, :user_created, :boolean
    
  end

  def down
    remove_column    :workouts, :user_created, :boolean
    
  end
end
