require 'active_record'
require 'rspec'
require 'division'
require 'employee'

database_configuration = YAML::load(File.open('./db/config.yml'))
test_configuration = database_configuration["test"]
ActiveRecord::Base.establish_connection(test_configuration)


RSpec.configure do |config|
  config.before(:each) do
    Employee.all.each {|employee| employee.destroy}
    Division.all.each {|division| division.destroy}
  end
end
