# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'luskydive'
set :repo_url, 'git@github.com:jSherz/luskydive.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
set :branch, 'refresh'

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/home/site/webapps/luskydive'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :rbenv_ruby, '2.1.0'

namespace :deploy do

  after :publishing, :compile_assets
  after :compile_assets, :migrate
  
  desc 'Restart application'
  after :migrate, :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
      execute :kill, '-HUP `cat pids/unicorn.pid`', raise_on_non_zero_exit: false
    end
  end

end
