module SchedulesHelper
  def schedule_type_icon(type)
    case type.to_s
    when "regular_schedule"
      "fas fa-calendar-week"
    when "exam_schedule"
      "fas fa-tasks"
    when "session_schedule"
      "fas fa-clipboard-list"
    when "academic_plan"
      "fas fa-book"
    else
      "fas fa-calendar"
    end
  end

  def schedule_type_class(type)
    case type.to_s
    when "regular_schedule"
      "bg-green-100 text-green-800"
    when "exam_schedule"
      "bg-red-100 text-red-800"
    when "session_schedule"
      "bg-orange-100 text-orange-800"
    when "academic_plan"
      "bg-purple-100 text-purple-800"
    else
      "bg-gray-100 text-gray-800"
    end
  end
end
