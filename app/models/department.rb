class Department < ApplicationRecord
  has_many :employees

  # TODO докинуть уникальность названия кафедры
  validates :name, presence: true, length: {minimum: 5}
  validates :description, presence: true, length: {minimum: 5}
end
