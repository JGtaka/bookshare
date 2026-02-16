class ArticlesController < ApplicationController
  def index
    @articles = Article.includes(:user)
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to articles_path, success: t('defaults.flash_message.created', item: Article.model_name.human)
    else
      flash.now[:danger] = t('defaults.flash_message.not_created', item: Article.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :curriculum)
  end
end
