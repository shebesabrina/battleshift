class VerificationController < ApplicationController
  def edit
    user = User.find_by(verification_token: params[:verification_token])
    user.verified = true
    user.save
    redirect_to '/confirmation' 
  end

end
