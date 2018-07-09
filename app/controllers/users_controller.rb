class UsersController < ApplicationController
  def create
    user = User.create(user_params)
    user.verified = false
    user.save
    session[:id] = user.id
    redirect_to dashboard_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
