class ErrorsController < ApplicationController
  layout "clean"
  def not_found
    render "errors/not_found"
  end
end
