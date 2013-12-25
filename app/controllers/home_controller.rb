class HomeController < ApplicationController
  def index
    @articles = Article.all  
    @recent_articles = Article.order("updated_at DESC").first(3)
  end
end
