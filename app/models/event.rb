class Event < ActiveRecord::Base
  belongs_to :employee
  validates :employee_id, presence: true
  validates :event_name, presence: true, length: { maximum: 50 }
end
