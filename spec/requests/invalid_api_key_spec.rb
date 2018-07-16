require 'rails_helper'

describe "Api::V1::games" do
  context "requests with an invalid api key" do
    let(:player_1_board)   { Board.new(4) }
    let(:player_2_board)   { Board.new(4) }
    describe 'the wrong api key' do
      it 'should return an error' do
        user1_attributes = {
          name:'the best user',
          email:'player_1@email.com',
          password:'password',
          verified:true
        }
        
        user1 = User.create(user1_attributes)

        uc1 = UserCreator.new(user1)

        uc1.make_api_token

        user1.save

        game_attributes = {
          player_1_board: player_1_board,
          player_2_board: player_2_board,
          player_1_turns: 0,
          player_2_turns: 0,
          current_turn: "player_1"
        }

        game = user1.games.create!(game_attributes)
    
        get "/api/v1/games/#{game.id}", headers: {'X-API-Key' => user1.api_token}
        expect(response.status).to eq(200)
        
        get "/api/v1/games/#{game.id}", headers: {'X-API-Key' => "123asdfasdf"}

        expect(response.status).to eq(400)
        expect(response.body).to include("Error, Invalid Api Token")
      end
    end
    describe 'requests infor on a game they are not a part of' do
      it 'should return an invalid api key error' do
        user1_attributes = {
          name:'the best user',
          email:'player_1@email.com',
          password:'password',
          verified:true
        }
        
        user1 = User.create(user1_attributes)

        uc1 = UserCreator.new(user1)

        uc1.make_api_token

        user1.save

        user2_attributes = {
          name:'the best user',
          email:'player_2@email.com',
          password:'password',
          verified:true
        }
        
        user2 = User.create(user2_attributes)

        uc2 = UserCreator.new(user2)

        uc2.make_api_token

        user2.save

        game_attributes = {
          player_1_board: player_1_board,
          player_2_board: player_2_board,
          player_1_turns: 0,
          player_2_turns: 0,
          current_turn: "player_1"
        }

        game = user1.games.create!(game_attributes)

        get "/api/v1/games/#{game.id}", headers: {'X-API-Key' => user2.api_token}

        expect(response.status).to eq(400)
        expect(response.body).to include("Error, Invalid Api Token")

      end
    end
  end
end
