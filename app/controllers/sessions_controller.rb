class SessionsController < ApplicationController
  def new

  end

  def create
    if params[:signup]

      if params[:password_confirmation] != params[:signup][:password]
        @error_signup = "Passwords do not match"
        render :new
      else
        user = User.create(params[:signup])
        redirect_to :root
      end

    else
      user = User.find_by(email: params[:email])

      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to :root
      else
        @error = "Incorrect email or password"
        render :new
      end
    end

  end

  def destroy
    session[:user_id] = nil

    redirect_to login_path
  end
end
