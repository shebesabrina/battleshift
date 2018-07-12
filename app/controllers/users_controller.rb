class UsersController < ApplicationController
  def create

    if user ||= UserCreator.new(User.new(user_params)).execute
      session[:id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = "Invalid information"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
