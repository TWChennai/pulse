require "eycap/recipes"

set :keep_releases, 5
set :application,   'pulse'
set :repository,    'git@github.com:kunday/pulse.git'
set :deploy_to,     "/data/#{application}"
set :deploy_via,    :remote_cache
set :monit_group,   "#{application}"
set :scm,           :git
set :copy_exclude,  ".git/*"
# This will execute the Git revision parsing on the *remote* server rather than locally
# set :real_revision,       lambda { source.query_revision(revision) { |cmd| capture(cmd) } }
# comment out if it gives you trouble. newest net/ssh needs this set.
ssh_options[:paranoid] = false



task :production do
  set :rails_env,     "production"
  set :user,          'express'
  set :password,      'rampup'
  set :runner,        'express'
  role :app,          "10.5.3.6"
  role :web,          "10.5.3.6"
end

namespace :deploy do  
  task :symlink_configs, :roles => :app, :except => { :no_symlink => true } do
    run "mkdir -p #{shared_path}/system/attachments"
    run <<-CMD
      cd #{release_path} &&
      ln -nfs #{shared_path}/config/couchdb.yml #{release_path}/config/couchdb.yml &&
      ln -nfs #{shared_path}/system/attachments #{release_path}/public/attachments
    CMD
  end
end


# uncomment the following to have a database backup done before every migration
# before "deploy:migrate", "db:dump"

# TASKS
# Don't change unless you know what you are doing!

after "deploy", "deploy:cleanup"
after "deploy:update_code","deploy:symlink_configs"


namespace :nginx do
  task :start, :roles => :app do
    sudo "nohup /etc/init.d/nginx start > /dev/null"
  end

  task :restart, :roles => :app do
    sudo "nohup /etc/init.d/nginx restart > /dev/null"
  end
end

namespace :deploy do
  namespace :notify do
    task :start do
    end
    
    task :stop do
    end
  end

  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
 
  task :stop, :roles => :app do
    # Do nothing.
  end
 
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end

