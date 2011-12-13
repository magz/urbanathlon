class User < ActiveRecord::Base
  validates :fb_id, :uniqueness => true, :presence => true
  has_many :ratings
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
  
    
    
  def update_average_rating
    new_rating=0
    self.ratings.all.each do |rating|
      new_rating += rating
    end
    new_rating = new_rating / self.ratings.count
    self.average_rating=new_rating
    
  end
  
end
