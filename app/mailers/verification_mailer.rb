class VerificationMailer < ApplicationMailer
  def verify(user)
    @user = user
    mail(to: user.email, subject: "Verify your account!")
  end
end
