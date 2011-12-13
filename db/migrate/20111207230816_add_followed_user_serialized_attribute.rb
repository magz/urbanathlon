class AddFollowedUserSerializedAttribute < ActiveRecord::Migration
  def up
    add_column :users, :followed_users, :text
  end

  def down
    remove_column :users, :followed_users
  end
end
