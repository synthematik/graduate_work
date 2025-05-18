class NotificationsController < ApplicationController
  before_action :require_authentication, only: [:create, :update, :destroy, :edit, :new]
  before_action :set_notification, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @notification = ::Notification.published.order(updated_at: :desc)
  end

  def new
    @notification = Notification.new
  end

  def create
    @notification = Notification.new(notification_params)
    if @notification.save
      redirect_to @notification, notice: "Объявление успешно создано"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @notification.update(notification_params)
      redirect_to @notification, notice: "Объявление обновлено"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @notification.destroy
    redirect_to notifications_path, notice: "Объявление удалено"
  end

  private

  def set_notification
    @notification = ::Notification.find(params[:id])
  end

  def notification_params
    params.require(:notification).permit(:title, :body, :published)
  end
end
