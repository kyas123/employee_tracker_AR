require 'spec_helper'

describe Employee do

  it { should have_and_belong_to_many :divisions}

  it 'will return all employees that work locally' do
    current_employees = (1..2).to_a.map { |number| Employee.create(name: "employee #{number}", remote: true)}
    remote_employee = Employee.create(name: 'remote_employee', remote: false)
    expect(Employee.local_employees).to eq current_employees
  end
end
