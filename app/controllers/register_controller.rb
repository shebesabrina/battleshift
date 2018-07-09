class RegisterController < ApplicationController
  def show
    @user = User.new
  end
end
