namespace :data do
  desc "all"
  task :all => ["db:create", "db:migrate", "spec"] do
  end

  desc "populates data"
  task :populate_metadata => :environment do
     ProjectTemplate.create
  end

  desc "data migration"
  task :migrate_data => :environment do
     ProjectTemplate.migrate_data
  end

  task :default => :populate_metadata
end