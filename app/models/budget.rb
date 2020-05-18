class Budget < ApplicationRecord
  
  
  
  belongs_to :employer
  has_many :timesheets
  validates :name, presence: true, uniqueness: true
  validates :hours, presence: true
  validate :end_after_start
  validates :start_date, :end_date, presence: true
 
  
  private
  def end_after_start
    return if end_date.blank? || start_date.blank?
    
    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
  
  
end
