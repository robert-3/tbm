class Employee < ApplicationRecord
  belongs_to :employer
  has_many :timesheets, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
