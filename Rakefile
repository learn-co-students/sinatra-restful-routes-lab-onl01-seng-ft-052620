ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

# Type `rake -T` on your command line to see the available rake tasks.

task :console do
  Pry.start
end

desc "Migrate both development and testing databases"
task :migrations do
  puts "Migrating databases..."
  system "rake db:migrate && rake db:migrate SINATRA_ENV=test"
end