class UserCreator
  def initialize(user)
    @user = user
  end

  def execute
    @user.verified = false
    make_api_token
    make_verification_token
    if @user.save
        VerificationMailer.verify(@user).deliver_now
      @user
    end
  end

  def make_api_token
    @user.api_token ||= SecureRandom.urlsafe_base64(30).to_s
  end

  def make_verification_token
    @user.verification_token ||= SecureRandom.urlsafe_base64.to_s
  end


end