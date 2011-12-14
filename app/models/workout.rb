class Workout < ActiveRecord::Base
  
  has_attached_file :photo, :url => "/system/photos/:id/:basename.:extension", :path => ":rails_root/public/system/photos/:id/:basename.:extension", :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_many :ratings
  
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
  
  def update_average_rating
    x = 0
    puts x
    if self.ratings.count != 0
      self.ratings.each do |rating|
        x += rating.value
      end
      self.average_rating = x / self.ratings.count
      self.save
    else
      self.average_rating = 3
      self.save
    end
  end
  


end
