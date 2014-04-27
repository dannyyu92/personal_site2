class HomeController < ApplicationController
  def index
    @articles = Article.all  
    @recent_articles = Article.order("created_at DESC").first(5)

    @projects = Project.all.order("created_at DESC")
    @recent_projects = Project.all.order("created_at DESC").first(3)

    @works = Work.all.order("created_at DESC")
  end

  def about
    if params[:name].present? && params[:message].present?
      SmsWorker.perform_async(params[:name], params[:message])
      redirect_to about_path, notice: "SMS successfully sent. Thanks!"
    end
  end
end