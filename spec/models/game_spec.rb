require 'rails_helper'

RSpec.describe Game, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  context 'instance methods' do
    let(:player_1_board)   { Board.new(4) }
    let(:player_2_board)   { Board.new(4) }
    
    describe 'vs_ai?' do
      it 'should return true if the game is vs a computer' do
        user_attributes = {
          name:'the best user',
          email:'player_1@email.com',
          password:'password',
          verified:true
        }
        user = User.new(user_attributes)
        uc = UserCreator.new(user)
        uc.make_api_token
        uc.make_verification_token
        user.save!


        game_attributes = {
          player_1_board: player_1_board,
          player_2_board: player_2_board,
          player_1_turns: 0,
          player_2_turns: 0,
          current_turn: "player_1"
        }

        game = user.games.create!(game_attributes)

        expect(game.vs_ai?).to eq(true)
      end
      it "should return false if it's against a human" do
        user_attributes = {
          name:'the best user',
          email:'someone@email.com',
          password:'password',
          verified:true
         }
        user = User.new(user_attributes)
        uc = UserCreator.new(user)
        uc.make_api_token
        uc.make_verification_token

        user.save!


        game_attributes = {
          player_1_board: player_1_board,
          player_2_board: player_2_board,
          player_1_turns: 0,
          player_2_turns: 0,
          current_turn: "player_1"
        }

        game = user.games.create!(game_attributes)

      end
    end
  end
end
