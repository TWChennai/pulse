# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))



require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'

task :all => ["db:create", "db:migrate", "spec"] do
end

task :populate_metadata => :environment do
   ProjectTemplate.create
end

task :migrate_data => :environment do
   ProjectTemplate.migrate_data
end

