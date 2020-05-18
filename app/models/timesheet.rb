class Timesheet < ApplicationRecord
  belongs_to :employee
  belongs_to :budget
  validates :name, presence: true, uniqueness: true
  validates :service_hours, presence: true
  validates :date_of_service, presence: true 
  validates :budget_id, presence: true, numericality: { only_integer: true }
  validate :within_budget_id_date_span
  
  validate :budget_id_hours_left
  
  private
  
  def within_budget_id_date_span
     if date_of_service < budget.start_date || date_of_service > budget.end_date
       errors.add(:Timesheet, "Date of service must be within the Budget date span!")
     end
  end
  
 
  
  def budget_id_hours_left
    if budget.timesheets.sum(&:service_hours) + service_hours > budget.hours
      errors.add(:Timesheet, "Not enough hours left in the Budget!")
    end
  end
  
end
