class VerificationController < ApplicationController
  def edit
    require'pry';binding.pry
    user = User.find_by(verification_token: params[:verification_token])
    user.verified = true
    user.save
    redirect_to '/confirmation'
  end

end
