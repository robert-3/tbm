class Employer < ApplicationRecord
  has_many :budgets, dependent: :destroy
  has_many :employees , dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :name, presence: true
end
