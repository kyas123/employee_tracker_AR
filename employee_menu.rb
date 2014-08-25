require 'active_record'
require './lib/division.rb'
require './lib/employee.rb'

database_configuration = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configuration["development"]
ActiveRecord::Base.establish_connection(development_configuration)


def welcome
  puts "***Welcome to Employee Tracker***"
  menu
end

def menu
  choice = nil
  until choice == 'x'
    puts "Press '1' to add an employee"
    puts "Press '2' to list employees"
    puts "Press '3' to add a division"
    puts "Press '4' to list all divisions"
    puts "Press 'x' to exit the program"
    choice = gets.chomp
    case choice
    when '1'
      add_employee
    when '2'
      list_employee
    when '3'
      add_division
    when '4'
      list_division
    when 'x'
      puts "Good-bye"
      system 'clear'
      exit
    else
      puts "Sorry, not a valid option."
    end
  end
end

def add_employee
  puts "What is your employees name?"
  employee_name = gets.chomp
  employee = Employee.new(:name => employee_name)
  employee.save
  "'#{employee.name}' has been added to your employee list."
  end

def list_employee
  puts "Here is a list of all your employees:"
  employees = Employee.all
  employees.each { |employee| puts employee.name }
end

def add_division
  puts "What is your divisions name?"
  division_name = gets.chomp
  division = Division.new(:name => division_name)
  division.save
  "'#{division.name}' has been added to your division list."
  end

def list_division
  puts "Here is a list of all your divisions:"
  divisions = Division.all
  divisions.each { |division| puts division.name }
end

welcome
