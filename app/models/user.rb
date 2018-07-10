class User < ApplicationRecord
  before_create :api_token_creation
  has_secure_password
  validates_presence_of :name, :email, :password_digest
  validates_uniqueness_of :api_token, :verification_token

  def confirmation_token
    if verification_token.blank?
      verification_token = SecureRandom.urlsafe_base64.to_s
    end
  end
  
  
  def api_token_creation
    if self.api_token.blank?
      self.api_token = SecureRandom.urlsafe_base64(30).to_s
    end
  end

end
