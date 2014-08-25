class Employee < ActiveRecord::Base

  has_and_belongs_to_many :divisions

  def self.local_employees
    where(remote: true)
  end
end
