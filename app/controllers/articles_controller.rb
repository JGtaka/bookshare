class ArticlesController < ApplicationController
  def index
    @articles = Article.includes(:user)
  end

  def new 
    @article = Article.new
  end
end
