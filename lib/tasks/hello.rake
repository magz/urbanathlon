task :move_to_obstacle_tag_model => :environment do
  puts "this utility moves from the dumb way of organizing obstacle/fitness tags to organizing them as a model"
  Workout.all.each do |workout|
    
    obstacle_tags = ["balance_beam", "ball_fields", "barricade", "bars", "beach", "bench", "bike_rack", "concrete_ledge", "court", "field", "fountain_edge", "grass_field", "hill", "hurdles", "outdoor_gym", "park", "picnic_benches", "playground", "sand_dunes", "stadium_steps", "stairs", "track",  "trail"]
    
    obstacle_tags.each do |tag|
      if workout.send("obstac_"+tag) == true
        WorkoutTag.create(:category => "obstacle", :name => tag.tr("_", " ").rstrip, :workout_id => workout.id)
      end
    end
  end
end

task :move_to_fitness_tag_model => :environment do
  puts "this utility moves from the dumb way of organizing obstacle/fitness tags to organizing them as a model"
  Workout.all.each do |workout|
    
    fitness_tags = ["agility", "balance", "cardio", "core", "endurance", "lower_body", "relaxation", "speed", "stability", "stretch", "stretching", "total_body", "whole_body", "upper_body"]
    
    fitness_tags.each do |tag|
      if workout.send("fit_"+tag) == true
        WorkoutTag.create(:category => "fitness", :name => tag.tr("_", " ").rstrip, :workout_id => workout.id)
      end
    end
  end
end

task :obstacle_tag_parser => :environment do
  puts "this utility will parse out the obstacle tags from the obstacle_tags strings into the various obstacle tag booleans"
  obstacle_tags = ["balance beam", "ball fields", "barricade", "bars", "beach", "bench", "bike rack", "concrete ledge", "court", "field", "fountain edge", "grass field", "hill", "hurdles", "outdoor gym", "park", "picnic benches", "playground", "sand dunes", "stadium steps", "stairs", "track",  "trail"]
  
  Workout.all.each do |workout|
    puts workout.obstacle
    obstacle_tags.each { |tag|
      
      if workout.obstacle.downcase.include? tag
        temp = tag.tr(" ", "_")
        puts temp
        workout.send("obstac_" + temp + "=", true)
        puts "obstac_" + temp + "= " + workout.send("obstac_" + temp).to_s
      end
    }
  begin
    workout.save!
    puts workout.name + "was saved successfully!"
  rescue
    puts "MAGS! THE WORKOUT WITH NAME" + workout.name + "did not save properly!"  
  end
  puts workout.name
  end
end
task :set_obstacles_to_false => :environment do
  errors = []
  
  puts "this utility will set all nil obstac_ values to false"
  obstacle_tags = ["balance beam", "ball fields", "barricade", "bars", "beach", "bench", "bike rack", "concrete ledge", "court", "field", "fountain edge", "grass field", "hill", "hurdles", "outdoor gym", "park", "picnic benches", "playground", "sand dunes", "stadium steps", "stairs", "track",  "trail"]
  Workout.all.each do |workout|
    puts workout.name + ":"
    obstacle_tags.each do |tag|
      temp = tag.tr(" ", "_")
      if workout.send("obstac_" + temp) == nil
        workout.send("obstac_" + temp + "=", false)
        puts "set something to false"
      end
    end
    begin
      workout.save!
    rescue
      errors << workout.name
    end
  end
  puts errors
end
task :set_fitness_to_false => :environment do
  errors = []
  puts "this utility will set all nil fit_ values to false"
  fitness_tags = ["agility", "balance", "cardio", "core", "endurance", "lower body", "relaxation", "speed", "stability", "stretch", "stretching", "total body", "whole body", "upper body"]
  Workout.all.each do |workout|
    puts workout.name + ":"
    fitness_tags.each do |tag|
      temp = tag.tr(" ", "_")
      if workout.send("fit_" + temp) == nil
        workout.send("fit_" + temp + "=", false)
        puts "set something to false"
      end
    end
    begin
      workout.save!
    rescue
      errors << workout.name
    end
  end
  puts errors
end


task :obstacle_tag_inspector => :environment do
  puts "this utiltity will diplay all of the obstacle tags"
  obstacle_tags = ["balance beam", "ball fields", "barricade", "bars", "beach", "bench", "bike rack", "concrete ledge", "court", "field", "fountain edge", "grass field", "hill", "hurdles", "outdoor gym", "park", "picnic benches", "playground", "sand dunes", "stadium steps", "stairs", "track",  "trail"]
  
  
  Workout.all.each do |workout|
    puts workout.name + ":"
    obstacle_tags.each do |tag|
      temp = tag.tr(" ", "_")
        if workout.send("obstac_" + temp).to_s == true
          puts "obstac_" + temp + "= " + workout.send("obstac_" + temp).to_s
        end 
      end
    end
  end


task :obstacle_test => :environment do
  puts "this utility will"
  obstacle_tags = ["balance beam", "ball fields", "barricade", "bars", "beach", "bench", "bike rack", "concrete ledge", "court", "field", "fountain edge", "grass field", "hill", "hurdles", "outdoor gym", "park", "picnic benches", "playground", "sand dunes", "stadium steps", "stairs", "track",  "trail"]
  
  Workout.all.each do |workout|
    puts workout
    puts workout.obstacle
    obstacle_tags.each { |tag|
      
      if workout.obstacle.include? tag
        puts tag
        
      end
    }
  end
end

task :fitness_tag_parser => :environment do
  puts "this utility will parse out the fitness tags from the obstacle_tags strings into the various obstacle tag booleans"
  fitness_tags = ["agility", "balance", "cardio", "core", "endurance", "lower body", "relaxation", "speed", "stability", "stretch", "stretching", "total body", "whole body", "upper body"]
  
  Workout.all.each do |workout|
    puts workout.fitness_tags
    fitness_tags.each { |tag|
      
      if workout.fitness_tags.downcase.include? tag
        temp = tag.tr(" ", "_")
        puts temp
        workout.send("fit_" + temp + "=", true)
        puts "fit_" + temp + "= " + workout.send("fit_" + temp).to_s
      end
    }
  begin
    workout.save!
    puts workout.name + "was saved successfully!"
  rescue
    puts "MAGS! THE WORKOUT WITH NAME" + workout.name + "did not save properly!"  
  end
  puts workout.name
  end
end

task :fix_lat_long => :environment do
  puts "this utility will ensure that all workouts have a positive latitude and negative longitude (this is true of everywhere in the US)"
  counter_x = 0
  counter_y = 0
  errors = []
  Workout.all.each do |workout|
    puts workout.name
    if workout.latitude < 0
      puts workout.latitude
      
      workout.latitude = (workout.latitude * -1)
      begin
        workout.save!
        puts workout.name + " was successfully fixed with respect to latitude (weird)"
        counter_y = counter_y + 1
      rescue
        puts workout.name + "needs to be fixed but wasn't for some reasons"
        errors << workout.name
      end
    end
    
    if workout.longitude > 0
      workout.longitude = (workout.longitude * -1)
      begin
        workout.save!
        puts workout.name + " was successfully fixed with respect to longitude"
        counter_x =  counter_x + 1
      rescue
        puts workout.name + "needs to be fixed but wasn't for some reasons"
        errors << workout.name
      
      end
    end
  end
  
  puts "fixed " 
  puts counter_x 
  puts "latitudes"
  puts "fixed " 
  puts counter_y 
  puts "longitudes"
  puts errors 
  puts "didn't work for some reason"
end
    
task :ballfields => :environment do
  puts "fixing ballfields"
  
  Workout.all.each do |workout|
    puts workout.name
    if workout.obstacle.include? "ballfield"
      workout.obstac_ball_fields = true
      workout.obstac_field = false
      begin
        workout.save!
        puts "saved successfully"
      rescue
        puts  workout.name + "did not save succesfully"
      end
    end
  end
end 

task :append_MH_and_ed_to_description => :environment do
  puts "MH suggests + ed comments => description"
  errors = []
  Workout.all.each do |workout|
    puts workout.name
    workout.description = workout.MH_suggests + workout.editor_comments
    begin
      workout.save!
    rescue
      puts "error"
      errors << workout.name
    end
  end
end

task :replace_at_signs => :environment do
  puts "replacing all @'s with 's "
  errors = []
  Workout.all.each do |workout|
    puts workout.name
    workout.description = workout.description.tr("@", "'")
    begin
      workout.save!
    rescue
      puts "error"
      errors << workout.name
    end
  end
end

task :fix_chicago_coords => :environment do
  puts "fixing chicago coordinates hopefully"
  names = ['Grant Park-"Agora"',
  '11th St Pedestrian Bridge',
  'Grant Park-concrete ramps',
  'John Logan Hill',
  'Fountain balance',
  'Grant Park baseball field sprints',
  'Grant Park lunges',
  'Grant Park tree figure 8s',
  'Grant Park stair balance',
  'Grant Park block jumps',
  'Michigan Ave bridge',
  'Field Museum steps',
  'Soldier Field trail',
  'Shedd Aquarium trail',
  'Buckingham Fountain sprints',
  'Grant Park Lily sprints',
  'Diversey Harbor Hill',
  'Diversey Harbor pull-ups',
  'Lincoln Park sit-ups',
  'Lincoln Park vault',
  'Lincoln Park roman chair',
  'Lincoln Park parallel bars',
  'Lincoln Park rings',
  'Lincoln Park  sit-ups',
  'Lincoln Park dips',
  'Lake front trail',
  'Lake front step ups',
  'Lake front hop kicks',
  'Lake shore broad jump sprints',
  'North Ave beach shuttle run',
  'North Ave beach high knee sand skips',
  'North Ave beach bear crawls',
  'North Ave beach sand sprints',
  'Castaways hurdles',
  'North Ave beach bench push-ups',
  'Diversey playground monkey bars',
  'Lake shore high knee sprint intervals',
  'Lake shore track walk',
  'Lake shore tennis court suicide sprints',
  'Oak St bench dips',
  'Oak St burpees',
  'Oak St ramp run',
  'Oak St sand sprints',
  'Oak St stretches',
  'Oak St crawls',
  'Oak St plank jumps',
  'Lake Front trail walk',
  'Navy Pier run',
  'Navy Pier loop',
  'Navy Pier lunges']
  lats=[41.867222,
  41.869167,
  41.87,
  41.870833,
  41.871944,
  41.872778,
  41.872778,
  41.870556,
  41.8725,
  41.854167,
  41.866944,
  41.865556,
  41.866667,
  41.8675,
  41.876944,
  41.876111,
  41.929167,
  41.929167,
  41.933611,
  41.935278,
  41.936667,
  41.936667,
  41.936944,
  41.9375,
  41.938889,
  41.938889,
  41.940278,
  41.934167,
  41.934167,
  41.939444,
  41.939444,
  41.939444,
  41.939444,
  41.912778,
  41.096389,
  41.933333,
  41.897222,
  41.897222,
  41.897222,
  0.901944,
  0.901944,
  0.887222,
  0.9025,
  0.9025,
  0.904167,
  0.902222,
  0.901944,
  0.9025,
  0.891667,
  0.891667]
  longs=[87.623333,
  87.623611,
  87.624167,
  87.624444,
  87.624167,
  87.623056,
  87.623056,
  87.623333,
  87.624167,
  87.624167,
  87.622778,
  87.618889,
  87.633611,
  87.6225,
  87.624167,
  87.623611,
  87.6375,
  87.636667,
  87.636667,
  87.636667,
  87.636944,
  87.636667,
  87.6375,
  87.637222,
  87.6375,
  87.637778,
  87.638611,
  87.636389,
  87.636389,
  87.635556,
  87.635556,
  87.635556,
  87.635556,
  87.625833,
  87.628889,
  87.625833,
  87.617778,
  87.617778,
  87.62,
  87.624444,
  87.624444,
  87.624167,
  87.624444,
  87.624444,
  87.624444,
  87.623333,
  87.623889,
  87.624444,
  87.609444,
  87.609444]
  
  
  errors = []
  
  (0..49).each do |number|
    puts
    exercise=Workout.where(:name=> names[number] + "\n").first
    if exercise == nil
      errors << names[number]
    else
      begin
        exercise.latitude = lats[number]
        exercise.longitude = longs[number] * -1
        exercise.save!
        puts "success!"
      rescue
        puts "problem correcting"
        errors << names[number]
      end
    end
  end
  puts "errors are:"
  puts errors
end
    
task :fix_iconic => :environment do
  puts "this should fix some things"
  icons =[]
  names = []
  errors = []
  File.open('/home/michaelmagner/var/http:/iconic.txt', 'r') do |f1| 
    while line = f1.gets  
      icons << line.downcase
    end
  end
  File.open('/home/michaelmagner/var/http:/place_names.txt', 'r') do |f1| 
    while line = f1.gets  
      names << (line)
    end
  end
  puts names
  (0..376).each do |number|
    
    if (icons[number] == "y\n")
      #puts "this should be sponsored"
      begin
        modded = Workout.where(:name => names[number] ).first
        #if modded == []
          #errors << names[number]
        #else
          #puts "found"
        #end
        modded.sponsored = true
        puts "trying to save...."
        modded.save!
        puts names[number]
        puts "was made sponsored!"
      rescue
        puts "error in there somewhere"
        errors << names[number]
      end
    end
  end
  #puts "errors are"
  #puts errors
end    
     
task :find_problems => :environment do
  places = ""
  problems = []
  File.open('/Users/michaelmagner/code/place_names.txt', 'r') do |f1|  
    while line = f1.gets  
      places = places + line + "\n"
    end   
  end  
Workout.all.each do |workout|
  if places.include? workout.name
    puts "found" 
  else
    problems << workout.name
  end
end
    puts problems
    
  puts "problems:"
  #puts problems
end
  
      
