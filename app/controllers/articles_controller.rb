class ArticlesController < ApplicationController
  def index
    @articles = Article.order("created_at DESC").all
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_url
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "Article successfully created"
    else
      render action: "new"
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to @article, notice: "Article successfully update"
    else
      render action: "edit"
    end
  end

  private
  def article_params
    params.require(:article).permit(:name, :posttype, :body, :date)
  end
end
