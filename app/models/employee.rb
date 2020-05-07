class Employee < ApplicationRecord
  belongs_to :employer, dependent: :destroy
  has_many :timesheets
  validates :name, presence: true, uniqueness: true
end
