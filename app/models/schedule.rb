class Schedule < ApplicationRecord
  belongs_to :user

  enum education_form: {full_time: "full_time", part_time: "part_time", mixed: "mixed"}
  enum semester_type: {winter: "winter", summer: "summer", spring: "spring", autumn: "autumn"}
  enum schedule_type: {regular_schedule: "regular_schedule", exam_schedule: "exam_schedule", session_schedule: "session_schedule", academic_plan: "academic_plan"}

  validates :title, :start_year, :end_year, :file_url, presence: true
end
