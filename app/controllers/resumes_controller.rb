class ResumesController < ApplicationController
  before_filter :require_login, except:[:index, :show]

  def index
    @resumes = Resume.all
  end

  def show
    @resume = Resume.find(params[:id])
  end

  def new
    @resume = Resume.new
  end

  def edit
    @resume = Resume.find(params[:id])
  end

  def create
    @resume = Resume.new(resume_params)
    if @resume.save
      redirect_to @resume, notice: 'Resume was successfully created.' 
    else
      render action: 'new'
    end
  end

  def update
    @resume = Resume.find(params[:id])
    if @resume.update(resume_params)
      redirect_to @resume, notice: 'Resume was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to resumes_url
  end

  private
    def resume_params
      params.require(:resume).permit(:pdf)
    end
end
