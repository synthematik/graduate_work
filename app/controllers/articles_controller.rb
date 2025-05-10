class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  def new
    @article = Article.new
  end

  def index
    @articles = ::Article.order(updated_at: :desc)
  end

  def show
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
