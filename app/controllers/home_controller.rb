class HomeController < ApplicationController
  def index
    @pagy, @articles = pagy(::Article.order(created_at: :desc), limit: 5)
  end
end
