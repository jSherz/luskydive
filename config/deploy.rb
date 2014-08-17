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
# set :default_env, {}

# Default value for keep_releases is 5
# set :keep_releases, 5

set :rbenv_ruby, '2.1.0'

namespace :deploy do

  # Adapted from https://github.com/mhutter/capistrano-recipes/blob/master/figaro.rb
  desc 'Links the production.yml file over for figaro'
  task :link_figaro_config do
    on roles(:app) do
      run 'ln -s #{shared_path}/application.yml #{release_path}/config/application.yml'
    end
  end

  # Adapted from http://stackoverflow.com/a/9034094/373230
  desc 'Start unicorn'
  task :start do
    on roles(:app) do
      within shared_path do
        execute :sh, "#{shared_path}/start.sh"
      end
    end
  end

  desc 'Stop unicorn'
  task :stop do
    on roles(:app) do
      within shared_path do
        execute :sh, "#{shared_path}/stop.sh"
      end
    end
  end

  desc 'Loads DB seeds for sample data'
  task :seed do
    on roles(:app) do
      within release_path do
        with rails_env: 'production' do
          execute :rake, 'db:seed'
        end
      end
    end
  end

  after :publishing, :link_figaro_config
  after :link_figaro_config, :compile_assets
  after :compile_assets, :migrate

end
