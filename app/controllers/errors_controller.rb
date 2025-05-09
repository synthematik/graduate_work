class ErrorsController < ApplicationController
  def not_found
    # TODO поправить верстку страницы
    render "errors/not_found"
  end
end
