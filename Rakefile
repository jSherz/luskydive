# Auto-add rake tasks by placing them in lib/tasks and ending them with .rake
# For example: lib/tasks/capistrano.rake

require File.expand_path('../config/application', __FILE__)
require 'rubocop/rake_task'

Rails.application.load_tasks
RuboCop::RakeTask.new
