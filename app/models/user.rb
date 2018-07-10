class User < ApplicationRecord
  has_secure_password
  validates_presence_of :name, :email, :password_digest
  validates_uniqueness_of :api_token, :verification_token

  def confirmation_token
    if verification_token.blank?
      verification_token = SecureRandom.urlsafe_base64.to_s
    end
  end


end
