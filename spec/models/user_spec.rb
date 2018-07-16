require 'rails_helper'

RSpec.describe User, type: :model do
  it {should validate_uniqueness_of(:api_token)}
  it {should validate_uniqueness_of(:verification_token)}
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:password_digest)}

  describe "Api Token" do
    it 'should be 32 characters long' do
      user_attributes = {
        name:'the best user',
        email:'someone@email.com',
        password:'password',
        verified:true
       }
      user = User.new(user_attributes)
      user = UserCreator.new(user).execute
      user.save!
      expect(user.api_token.length).to be > 30
    end

    it 'should contain only alpha numerics, no special characters' do
      user_attributes = {
        name:'the best user',
        email:'someone@email.com',
        password:'password',
        verified:true
       }
      user = User.new(user_attributes)
      user = UserCreator.new(user).execute
      user.save!
      expect(user.api_token).to_not match(/W^[\_\=\-]/)
    end
  end
end
