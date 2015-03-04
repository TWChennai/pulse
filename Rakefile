require File.expand_path('../config/application', __FILE__)

require 'rake'

task :all => ["db:create", "db:migrate", "spec"] do
end

task :populate_metadata => :environment do
   ProjectTemplate.create
end

task :migrate_data => :environment do
   ProjectTemplate.migrate_data
end

Pulse::Application.load_tasks
