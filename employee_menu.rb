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
    puts "Press '5' to list remote employees"
    puts "Press '6' to add an employee to a division"
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
    when '5'
      list_remote
    when '6'
      employee_to_division
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

def list_remote
  puts "Whos working in Guam?"
  Employee.all.each { |employee| puts employee.name}
  remote_employee_name = gets.chomp
  remote_employee_name = Employee.where(name: remote_employee_name).first
  remote_employee.update(remote: false)
  puts "'#{remote_employee_name}' works in Guam"
end

def employee_to_division
  list_employee
  result = ''
  puts "Which employee would you like to assign:"
  employee_input = gets.chomp
  puts  "What division would you like them to be assigned to?"
  division_input = gets.chomp
  x = Division.where(:name => division_input)
  newVar = x.first.to_i
  y = Employee.where(:name => employee_input)
  newVar1 = y.first.to_i
  new_contribution = Contribution.create(:employee_id => newVar1.id, :division_id => newVar.id)
end

welcome
