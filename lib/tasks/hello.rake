task :obstacle_tag_parser => :environment do
  puts "this utility will parse out the obstacle tags from the obstacle_tags strings into the various obstacle tag booleans"
  obstacle_tags = ["balance beam", "ball fields", "barricade", "bars", "beach", "bench", "bike rack", "concrete ledge", "court", "field", "fountain edge", "grass field", "hill", "hurdles", "outdoor gym", "park", "picnic benches", "playground", "sand dunes", "stadium steps", "stairs", "track",  "trail"]
  
  Workout.all.each do |workout|
    
    obstacle_tags.each { |tag|
      
      if workout.obstacle.include? tag
        method = "obstac_" + tag.tr(" ", "_")
        workout.instance_variable_set("@" + method, true)
      end
    }
  begin
    workout.save!
  rescue
    puts "MAGS! THE WORKOUT WITH NAME" + workout.name + "did not save properly!"  
  end
  puts workout.name
  end
end

  