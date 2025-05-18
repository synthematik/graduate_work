class Admin::DashboardController < Admin::BaseController
  def index
    @users_count = User.count
    @articles_count = Article.count
    @notifications_count = Notification.count
    @events_count = Event.count
    @schedules_count = Schedule.count
    @departments_count = Department.count
    @employees_count = Employee.count

    @recent_users = User.order(created_at: :desc).limit(5)
    @recent_articles = Article.order(created_at: :desc).limit(5)
  end
end
