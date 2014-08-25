require 'spec_helper'

describe Employee do
#   it 'can be added to a division' do

# end

  it 'will return all employees that work remotely' do
    current_employees = (1..2).to_a.map { |number| Employee.create(name: "employee #{number}", remote: true)}
    remote_employee = Employee.create(name: 'remote_employee', remote: false)
    expect(Employee.local_employees).to eq current_employees
  end
end
