module Admin::UsersHelper
  def role_badge_color(role)
    case role
    when "admin" then "bg-purple-100 text-purple-800"
    when "moderator" then "bg-blue-100 text-blue-800"
    else "bg-gray-100 text-gray-800"
    end
  end
end
