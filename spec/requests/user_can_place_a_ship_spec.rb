require 'rails_helper'

describe "Api::V1::ships" do
  context "POST /api/v1/games/:id/ships" do
    it 'should place a ship on the board' do
      user1_attributes = {
        name:'the best user',
        email:'player_1@email.com',
        password:'password',
        verified:true
       }
       user2_attributes = {
        name:'the worst user',
        email:'player_2@email.com',
        password:'password',
        verified:true
       }
      user1 = User.create(user1_attributes)
      user2 = User.create(user2_attributes)

      uc1 = UserCreator.new(user1)
      uc2 = UserCreator.new(user2)

      uc1.make_api_token
      uc2.make_api_token

      user1.save
      user2.save


    end
  end
end
