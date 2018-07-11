class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params["user"]['email'])
    if user && user.authenticate(params["user"]["password"])
      session[:id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = 'Invalid username and/or password. Please try again!'
      redirect_to login_path
    end
  end

  def destroy
    session[:id] = nil
    redirect_to root_url
  end
end
