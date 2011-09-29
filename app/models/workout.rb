class Workout < ActiveRecord::Base
  #temporarily disabled this so it can work on heroku
  #has_attached_file :photo, :url => "/system/photos/:id/:basename.:extension", :path => ":rails_root/public/system/photos/:id/:basename.:extension", :styles => { :medium => "300x300>", :thumb => "100x100>" }
  acts_as_gmappable
  

  def gmaps4rails_address
    "#{self.latitude}, #{self.longitude}"
  end
  
  


end
