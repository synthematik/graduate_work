class Employee < ApplicationRecord
  belongs_to :user
  belongs_to :department, optional: true

  validates :first_name, :last_name, presence: true, length: {minimum: 2}
  validates :middle_name, :degree, :rank, :description, length: {minimum: 2}
end
