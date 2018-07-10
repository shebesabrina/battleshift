class SessionsController < ApplicationController
  def destroy
    binding.pry
    if current_user
      session[:id] = nil
    end
    redirect_to root_url
  end
end
