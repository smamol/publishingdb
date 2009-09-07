set :application, "publishingdb"
set :domain, "123sandy.nestorius.hostingrails.com"
set :user, "sandyma"
set :repository,  "svn+ssh://#{user}@#{domain}/home/#{user}/svn/#{application}/trunk"
set :use_sudo, false
set :group_writable, false
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :checkout
set :chmod755, "app config db lib public vendor script script/* public/disp*"
default_run_options[:pty] = true
set :mongrel_port, "4202"
role :app, domain
role :web, domain
role :db,  domain, :primary => true
