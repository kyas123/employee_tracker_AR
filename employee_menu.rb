require 'active_record'
require './lib/division.rb'
require './lib/employee.rb'

database_configuration = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configuration["development"]
ActiveRecord::Base.establish_connection(development_configuration)
