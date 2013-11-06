class Project < ActiveRecord::Base
  belongs_to :supervisor
  has_many :employees
end
