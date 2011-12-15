class AddUserCreatedId < ActiveRecord::Migration
  def up
    add_column :workouts, :user_id, :integer
  end
  def down
    remove :workouts, :user_id
  end

end

