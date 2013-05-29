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
set :rails_env, 'staging'
set :keep_releases, 2
 
server "121.199.5.92", :app, :web, :db, :primary => true
set :user, "root"
set :use_sudo, false


namespace :deploy do

  after "deploy:update_code", :test1
  task :test1 do
      run "echo 1"
  end

  after "deploy:update_code", :test2
  task :test2 do
      run "echo 2"
  end
  
end