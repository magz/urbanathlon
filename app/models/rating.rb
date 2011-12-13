class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :workout
  validates :user_id, :workout_id, :value, :exists => true
  #check that this works
  #this should be after_save but something weird is going on
  after_validation :update_average_rating_of_workout
  
  def update_average_rating_of_workout
    self.workout.update_average_rating
  end
  
end
