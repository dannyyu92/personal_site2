class HomeController < ApplicationController
  require "twilio-ruby"

  def index
    @articles = Article.all  
    @recent_articles = Article.order("created_at DESC").first(5)

    @projects = Project.all.order("created_at DESC")
    @recent_projects = Project.all.order("created_at DESC").first(3)

    @works = Work.all.order("created_at DESC")
  end

  def about
    if params[:name].present? && params[:message].present?
      send_sms_message(params[:name], params[:message])
      redirect_to about_path, notice: "SMS successfully sent. Thanks!"
    end
  end

  private
  def send_sms_message(name, msg)
    # set up a client to talk to the Twilio REST API 
    @client = Twilio::REST::Client.new ENV["TWILIO_SID"], ENV["TWILIO_AUTH_TOKEN"]
    @client.account.sms.messages.create({
      :from => ENV["TWILIO_PHONE_FROM"],
      :to => ENV["TWILIO_PHONE_TO"],
      :body => "#{name}: #{msg}"
    })
  end
end
