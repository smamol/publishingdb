load 'deploy' if respond_to?(:namespace) # cap2 differentiator
load 'config/deploy'


# ========================
#    For Mongrel Apps
# ========================

 namespace :deploy do

  task :copy_database_configuration
     production_db_config = "home/sandyte/script/database.yml"
     run "cp #{production_db_config}" "{release_path}/config/database.yml"
  end
 
   task :start, :roles => :app do
     run "rm -rf /home/#{user}/public_html;ln -s #{current_path}/public /home/#{user}/public_html"
     run "cd /home/sandyte/script && sh restart-mon.sh"
   end
 
   task :restart, :roles => :app do
     run "cd /home/sandyte/script && sh restart-mon.sh"
   end
  
   after "deploy:update_code", "deploy:copy_database_configuration" 

 end