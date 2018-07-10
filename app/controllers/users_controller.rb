class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.verified = false
    if user.save
      session[:id] = user.id
      VerificationMailer.verify(current_user).deliver_now
      redirect_to dashboard_path
    else
      flash[:error] = "Invalid information"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
