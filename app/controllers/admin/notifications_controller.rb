class Admin::NotificationsController < Admin::BaseController
  before_action :set_notification, only: [:show, :edit, :update, :destroy]

  def index
    @pagy, @notifications = pagy(Notification.includes(:user).order(created_at: :desc), items: 10)
  end

  def show
  end

  def new
    @notification = Notification.new
  end

  def create
    @notification = Notification.new(notification_params)
    @notification.user = current_user

    if @notification.save
      flash[:notice] = "Уведомление успешно создано."
      redirect_to admin_notifications_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @notification.update(notification_params)
      flash[:notice] = "Уведомление успешно обновлено."
      redirect_to admin_notifications_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @notification.destroy
    flash[:notice] = "Уведомление успешно удалено."
    redirect_to admin_notifications_path
  end

  def publish
    @notification = ::Notification.find(params[:id])
    @notification.update(published: true)
    redirect_back fallback_location: admin_notification_path(@notification), notice: "Объявление опубликовано"
  end

  def unpublish
    @notification = ::Notification.find(params[:id])
    @notification.update(published: false)
    redirect_back fallback_location: admin_notification_path(@notification), notice: "Объявление снято с публикации"
  end

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end

  def notification_params
    params.require(:notification).permit(:title, :body, :published, :user_id)
  end
end
