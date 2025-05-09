class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  def new
    @article = Article.new
  end

  def index
    @articles = ::Article.all.sort_by(&:updated_at)
  end

  def show
    @articles_with_notification = ::Article.where(is_notification: true).sort_by(&:updated_at).last(5)
  end

  def create
    @article = Article.new article_params
    if @article.save
      redirect_to root_path, notice: "Статья успешно создана"
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
