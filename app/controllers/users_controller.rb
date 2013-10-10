class UsersController < ApplicationController

  def index
    redirect_to :root
  end

  def show
    if params[:id].to_i == session[:user_id].to_i
      @user = User.find(params[:id])
    else
      @error = "You can view your profile only."
      render 'homes/index'
    end
  end 

  # sign up 
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user 
    else
      @signup_errors = @user.errors.full_messages
      render "sessions/new"
    end 
  end 

  private 

    def user_params
      params.require(:signup).permit(:username, :email, :password, :password_confirmation)
    end

end 