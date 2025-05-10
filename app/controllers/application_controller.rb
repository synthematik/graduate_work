class ApplicationController < ActionController::Base
  include Authentication
  include ::Pagy::Backend

  before_action :set_locale

  private

  def set_locale
    I18n.locale = :ru
  end
end
