require 'rails_helper'

RSpec.describe User, type: :model do
  it {should validate_uniqueness_of(:api_token)}
  it {should validate_uniqueness_of(:verification_token)}
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:password_digest)}

  describe "Api Token" do
    it 'should be 32 characters long' do
      expect(api_token.length).to be(32)
    end

    it 'should contain only alpha numerics, no special characters' do
      expect(api_token).to match(/w/)
      expect(api_token).to_not match(/\W/)

    end
  end
end
