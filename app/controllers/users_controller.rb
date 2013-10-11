class UsersController < ApplicationController

  def index
    redirect_to :root
  end

  # def show
  #   if current_user
  #     if params[:id].to_i != current_user.id
  #       @error = "You can view your profile only."
  #       render 'homes/index'
  #     end
  #   else
  #     @error = "You need to be logged in to view your profile"
  #     render 'sessions/new'
  #   end
  # end

  # # sign up 
  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     session[:user_id] = @user.id
  #     redirect_to @user 
  #   else
  #     @signup_errors = @user.errors.full_messages
  #     render "sessions/new"
  #   end 
  # end 

  # private 

  #   def user_params
  #     params.require(:signup).permit(:username, :email, :password, :password_confirmation)
  #   end

end 