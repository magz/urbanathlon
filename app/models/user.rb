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
  end

  def self.generate_local_leaderboard
    puts "not generating local leaderboard"
  end  

  def self.where_fb_id(facebook)
    user=User.where(:fb_id => facebook).first
  end  
  
  def to_verbose_json(user)
    result={}
    user.attributes.each do |k,v|
      #this if statement is to keep some @user attributes out of results...it feels like it shouldn't be needed, since update should overwrite it, but that doesn't seem to be happening...fix this
      if k != "favorite_workouts" && k != "followed_users"
        result.update(k => v)
      end
    end
  
    #test this...i'm pretty sure it works though!  GJ magz!
    [[Workout, :workouts], [Favorite, :favorites], [Rating, :completed]].each do |cat, sym|
    #pull the full workout/favorites/ratings attributes out of the database
      temp=[]
      cat.where(:user_id => user).each do |f|
        temp << f
      end
      result.update(sym => temp)
    end
    
    
    #this one i think is necessary, since it is collecting the attributes of the followed_users
    @user.followed_users.each do |f|
      begin
      friends << User.find(f).attributes
      rescue
      end
    end
    result.update(:followed_users => friends)
    #and now this should return result
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
