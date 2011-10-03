class Workout < ActiveRecord::Base
  #temporarily disabled this so it can work on heroku
  #has_attached_file :photo, :url => "/system/photos/:id/:basename.:extension", :path => ":rails_root/public/system/photos/:id/:basename.:extension", :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  #tags for doing gmaps and reverse geocoding (gmaps4rails and geocoding gems)
  acts_as_gmappable
  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      # populate your model
      obj.city    = geo.city
      obj.zipcode = geo.postal_code
    end
  end
  
  geocoded_by :address
  after_validation :fetch_address
  
  
  

  def gmaps4rails_address
    "#{self.latitude}, #{self.longitude}"
  end
  
  


end
