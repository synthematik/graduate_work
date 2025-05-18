class Admin::BaseController < ApplicationController
  layout "admin"

  before_action :authenticate_admin!

  private

  # TODO  && current_user.employee?
  def authenticate_admin!
    unless user_signed_in? && current_user.admin_role?
      flash[:alert] = "У вас нет доступа к панели администрирования."
      render "errors/not_found", layout: "clean"
    end
  end
end
