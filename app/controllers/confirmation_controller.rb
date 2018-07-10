class ConfirmationController < ApplicationController
  def show 
    @user = current_user
  end
end
