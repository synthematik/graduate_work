class HomeController < ApplicationController
  def index
    @articles = ::Article.all.sort_by(&:updated_at).last(5)
    @users = ::User.all
  end
end
