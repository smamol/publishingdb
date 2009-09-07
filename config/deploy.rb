set :application, "publishingdb"
set :domain, "68.233.8.201"
set :user, "sandyte"
set :repository,  "svn+ssh://#{user}@#{domain}/home/#{user}/svn/#{application}/trunk"
set :use_sudo, false
set :group_writable, false
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :checkout
set :chmod755, "app config db lib public vendor script script/* public/disp*"
default_run_options[:pty] = true
set :mongrel_port, " 4082"
role :app, domain
role :web, domain
role :db,  domain, :primary => true
