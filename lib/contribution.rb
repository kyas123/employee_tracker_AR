class Contribution < ActiveRecord::Base
  belongs_to :employees
  belongs_to :divisions
end
