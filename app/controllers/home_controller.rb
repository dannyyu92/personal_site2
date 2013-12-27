class HomeController < ApplicationController
  def index
    @articles = Article.all  
    @recent_articles = Article.order("updated_at DESC").first(5)

    @projects = Project.all
  end
end
