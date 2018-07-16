class User < ApplicationRecord
  has_secure_password
  has_many :participants
  has_many :games, through: :participants
  
  validates_presence_of :name, :email, :password_digest
  validates_uniqueness_of :api_token, :verification_token
  validates_confirmation_of :password_confirmation


end
