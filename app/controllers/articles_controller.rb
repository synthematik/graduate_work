class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_authentication, except: [:index, :show]
  def new
    @article = Article.new
  end

  def index
    @articles = ::Article.order(updated_at: :desc)
  end

  def update
    if @article.user == current_user
      if @article.update(article_params)
        redirect_to article_path(@article), notice: "Статья успешно обновлена"
      else
        render :edit
      end
    else
      redirect_to root_path, alert: "У вас нет прав на редактирование этой статьи"
    end
  end

  def edit
    redirect_to root_path, alert: "У вас нет прав на редактирование этой статьи" unless current_user == @article.user
  end

  def destroy
    if @article.user == current_user
      @article.destroy
      redirect_to root_path, notice: "Статья успешно удалена"
    else
      redirect_to root_path, alert: "У вас нет прав на удаление этой статьи"
    end
  end

  def show
  end

  def create
    article_params.merge({user_id: current_user.id})

    @article = Article.new article_params.merge({user_id: current_user.id})
    if @article.save!
      redirect_to root_path, notice: "Статья успешно создана"
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, photos: [])
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
