class User < ApplicationRecord
  has_secure_password
  has_many :participants
  has_many :games, through: :participants
  
  validates_presence_of :name, :email, :password_digest
  validates_uniqueness_of :api_token, :verification_token
  validates_confirmation_of :password_confirmation

  def confirmation_token
    if verification_token.nil?
      self.verification_token = SecureRandom.urlsafe_base64.to_s
    end
  end


end
