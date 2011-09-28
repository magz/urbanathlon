set :application, "urbanthlon.fuzzproductions.com"
set :repository,  "git@github.com:magz/urbanathlon.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, "michaelmagner"
set :use_sudo, false
set :deploy_to, "var/#{application}"
set :deploy_via, :remote_cache

role :web, "urbanathlon.fuzzproductions.com"                          # Your HTTP server, Apache/etc
role :app, "urbanathlon.fuzzproductions.com"                          # This may be the same as your `Web` server
role :db,  "urbanathlon.fuzzproductions.com", :primary => true # This is where Rails migrations will run
role :db,  "urbanathlon.fuzzproductions.com"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

after "deploy", "deploy:bundle_gems"
after "deploy:bundle:gems", "deploy:restart"


# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :bundle_gems do
     run "cd #{deploy_to}/current && bundle install vendor/gems"
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end
 end