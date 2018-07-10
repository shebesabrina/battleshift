require 'rails_helper'

RSpec.describe User, type: :model do
  it {should validate_uniqueness_of(:api_token)}
  it {should validate_uniqueness_of(:verification_token)}
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:password_digest)}
end
