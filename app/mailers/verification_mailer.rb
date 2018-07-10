class VerificationMailer < ApplicationMailer
  include Rails.application.routes.url_helpers
  def verify(user)
    @user = user
    mail(to: @user.email, subject: "Verify your account!")
  end
end
