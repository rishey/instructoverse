class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def create
    @course = Course.new(params[:course].permit(:title, :url, :description))
    if @course.save
      redirect_to @course
    else
      render 'new'
    end
  end

  def new
    @course = Course.new
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end 

  private
  def post_params
    params.require(:course).permit(:title, :url, :description)
  end
end
