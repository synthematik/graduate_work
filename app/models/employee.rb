class Employee < ApplicationRecord
  belongs_to :user
  belongs_to :department, optional: true

  validates :first_name, :last_name, presence: true, length: {minimum: 2}
  validates :middle_name, :degree, :rank, :description, length: {minimum: 2}

  validates :user_id, uniqueness: true, allow_nil: true

  # Полное имя сотрудника
  def full_name
    [last_name, first_name, middle_name].reject(&:blank?).join(" ")
  end

  def short_name
    "#{last_name} #{first_name.first}. #{middle_name.first if middle_name.present?}#{middle_name.present? ? "." : ""}"
  end
end
