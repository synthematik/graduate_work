class HomeController < ApplicationController
  def index
    @articles = ::Article.all.sort_by(&:updated_at)
    @users = ::User.all
  end
end
