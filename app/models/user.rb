class User < ActiveRecord::Base
  validates :fb_id, :uniqueness => true, :presence => true
  has_many :ratings
  has_many :favorites
  has_many :workouts
  serialize :followed_users, Array
  
  def initialize(params={})
   super(params)
   self.score=0
   self.followed_users=[]
   self.favorite_workouts=[]
  end

  def self.generate_local_leaderboard
    puts "not generating local leaderboard"
  end  

  def self.where_fb_id(facebook)
    user=User.where(:fb_id => facebook).first
  end  
  
  def to_verbose_json
    result=self.to_json[0, self.to_json.length-1]
    
    result += ", ratings: ["
    if self.ratings != []
      self.ratings do |rating|
        result += rating.to_json + ","
      end
      result = result[0, result.length-1]
    end
    result += "]"
        
    
    result += ", created_workouts: ["
    if Workout.where(:user_id => self) != []
      Workout.where(:user_id => self).each do |workout|
        result += workout.to_json + ","
      end
    result = result[0, result.length-1]
    end
    result += "]"
    
  
    result += "}"
  end
    
  def update_average_rating
    new_rating=0
    self.ratings.all.each do |rating|
      new_rating += rating
    end
    new_rating = new_rating / self.ratings.count
    self.average_rating=new_rating
    
  end
  
end
