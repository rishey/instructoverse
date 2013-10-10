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
    @user = User.find(2) #session[:id]
    if @user = @course.creator_id
      @creator = @user
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(params[:course].permit(:title, :url, :description))
      redirect_to @course
    else
      render "edit"
    end
  end

  def favorite
    user = User.find(session[:user_id])
    course = Course.find(params[:id])
    if user.attended_courses.include?(course)
      redirect "/users/<%= user.id %>"
    else
      user.attended_courses << course
      redirect "/users/<%= user.id %>"      
    end
  end

  def unfavorite
    user = User.find(session[:user_id])
    course = Course.find(params[:id])
    if user.attended_courses.include?(course)
      user.attended_courses.delete(course)
      redirect "/users/<%= user.id %>"  
    else
      redirect "/users/<%= user.id %>"
    end
  end


  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    # Change this to user profile
    redirect_to courses_path
  end 

  private
  def post_params
    params.require(:course).permit(:title, :url, :description)
  end
end
