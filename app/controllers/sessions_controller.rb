class SessionsController < ApplicationController

  def new 
  end

  def destroy
    session.clear
    flash[:success] = "Successfully Signed Out"
    redirect_to root_path
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully Signed in as #{user.username}"
      redirect_to user_path(user)
    else
      flash[:failure] = "Failed to Sign In"
      redirect_to root_path
    end
  end

end