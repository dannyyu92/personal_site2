class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :globals

# Maybe I'll implement this later...
=begin
  def globals
    @global_resume = Resume.all
  end
=end

  private
  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end
end
