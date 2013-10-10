class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user 
    else 
      render 'new'
    end 
  end 

  private 

  def user_params
    params.require(:signup).permit(:username, :email, :password, :password_confirmation)
  end

end 