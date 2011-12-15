class AddCityToUser < ActiveRecord::Migration
  def up
    add_column :users, :city, :string
  end
  def down
    remove :users, :city
  end
end
