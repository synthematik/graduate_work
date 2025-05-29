class Department < ApplicationRecord
  has_many :employees

  validates :name, presence: true,
    length: {minimum: 5, maximum: 100},
    uniqueness: {case_sensitive: false}
  validates :description, presence: true, length: {minimum: 10, maximum: 1000000}

  scope :ordered, -> { order(name: :asc) }

  def to_s
    name
  end
end
