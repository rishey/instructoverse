class CoursesController < ApplicationController
  def index
    @courses = Course.all
    @user = current_user
  end

  def create
    @user = current_user
    @course = @user.created_courses.new(params[:course].permit(:title, :url, :description))
    if @course.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def new
    @course = Course.new
  end

  def show
    @course = Course.find(params[:id])
    @user = User.find(session[:user_id]) #session[:id]
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
      redirect_to "/users/#{user.id}"
    else
      user.attended_courses << course
      redirect_to "/users/#{user.id}"     
    end
  end

  def unfavorite
    user = User.find(session[:user_id])
    course = Course.find(params[:id])
    if user.attended_courses.include?(course)
      user.attended_courses.delete(course)
      redirect_to "/users/#{user.id}"  
    else
      redirect_to "/users/#{user.id}"
    end
  end


  def destroy
    @user = User.find(session[:user_id])
    @course = Course.find(params[:id])
    @course.destroy
    # Change this to user profile
    redirect_to user_path
  end 

  private
  def post_params
    params.require(:course).permit(:title, :url, :description)
  end
end
