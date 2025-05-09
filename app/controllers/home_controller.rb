class HomeController < ApplicationController
  def index
    @articles = ::Article.all.sort_by(&:updated_at).last(5)
    @users = ::User.all
    @articles_with_notification = ::Article.where(is_notification: true).sort_by(&:updated_at).last(5)
  end
end
