class AddMoreAttributes < ActiveRecord::Migration
  def up
    add_column    :workouts, :sponsored, :boolean
    add_column    :workouts, :fitness_tags, :string
    add_column    :workouts, :obstacle, :string
    add_column    :workouts, :MH_suggests, :string
    add_column    :workouts, :editor_comments, :string
    add_column    :workouts, :photo_label, :string
    
  end

  def down
    remove_column    :workouts, :sponsored, :boolean
    remove_column    :workouts, :fitness_tags, :string
    remove_column    :workouts, :obstacle, :string
    remove_column    :workouts, :MH_suggests, :string
    remove_column    :workouts, :editor_comments, :string
    remove_column    :workouts, :photo_label, :string
  end
end
