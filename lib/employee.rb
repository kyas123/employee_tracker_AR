class Employee < ActiveRecord::Base

  def self.local_employees
    where(remote: true)
  end
end
