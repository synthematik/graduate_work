class HomeController < ApplicationController
  def index
    @pagy, @articles = pagy(::Article.order(updated_at: :asc), limit: 5)
    @articles_with_notification = ::Article.where(is_notification: true).sort_by(&:updated_at).last(5)
  end
end
