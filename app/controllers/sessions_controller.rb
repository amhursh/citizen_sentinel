class SessionsController < ApplicationController

  def new 
  end

  def create
    default_login? ? user = default_login_info : user = oauth_login_info
    if user
      session[:user_id] = user.id
      flash[:success] = "Successfully Signed in as #{user.username}"
      redirect_to user_path(user)
    else
      flash[:failure] = "Failed to Sign In"
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    flash[:success] = "Successfully Signed Out"
    redirect_to root_path
  end

  private

    def authenticated?(user)
      user && user.authenticate(params[:session][:password])
    end

    def default_login?
      params[:session]
    end

    def default_login_info
      user = User.find_by(username: params[:session][:username])
      if user && authenticated?(user)
        user
      end
    end

    def oauth_login_info
      User.from_oauth(request.env['omniauth.auth'])
    end

end