class ApplicationController < ActionController::Base
  include Authentication
  include ::Pagy::Backend

  before_action :set_locale
  before_action :load_data, if: -> { %w[home articles notifications events].include?(controller_name) }

  private

  def set_locale
    I18n.locale = :ru
  end

  def load_data
    @notifications = ::Notification.published.order(updated_at: :desc).limit(5)
    @events = ::Event.published.order(starts_at: :asc).limit(5)
  end
end
