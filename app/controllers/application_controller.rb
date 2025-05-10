class ApplicationController < ActionController::Base
  include Authentication
  include ::Pagy::Backend

  before_action :set_locale
  before_action :load_notifications, if: -> { %w[home articles notifications].include?(controller_name) }

  private

  def set_locale
    I18n.locale = :ru
  end

  def load_notifications
    @notifications = ::Notification.order(updated_at: :desc).limit(5)
  end
end
