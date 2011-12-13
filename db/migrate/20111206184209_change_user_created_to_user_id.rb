class ChangeUserCreatedToUserId < ActiveRecord::Migration
  def up
    remove_column    :workouts, :user_created
    add_column       :workouts, :created_by_id, :integer
  end

  def down
    add_column       :workouts, :user_created, :boolean
    remove_column    :workouts, :created_by_id
  
  end
end
