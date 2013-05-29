# coding: utf-8

load 'deploy/assets'

require "rvm/capistrano"
# set :rvm_ruby_string, '1.9.3'
set :rvm_type, :system
# set :rvm_bin_path, "/usr/local/rvm/bin"
set :rvm_path, "/usr/local/rvm"
require "bundler/capistrano"
 
#man details
set :application, "ckm"
set :repository,  "https://github.com/ayumi043/ckm.git"
set :deploy_to, "/home/lzx/ckm"  #部署的地址
set :scm, :git
set :scm_verbose, true
set :deploy_via, :remote_cache
set :rails_env, 'product'
set :keep_releases, 2
 
server "121.199.5.92", :app, :web, :db, :primary => true
set :user, "root"
set :use_sudo, false


namespace :deploy do

  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "sudo /etc/init.d/nginx restart"
  end

  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=#{rails_env}"
  end
  
end