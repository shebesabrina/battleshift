class Api::V1::Games::ShipsController < ApiController

  def create
    ship = Ship.new(params["ship_size"])

    game = @user.games.find(params["game_id"])

    placer = ShipPlacer.new(board: board_set(game), ship: ship, start_space: params["start_space"], end_space: params["end_space"])

    placer.run
    game.save!
    render json: game, status: 200, message: placer.message
  end

  def board_set(game)
  
    if @user == game.player_1
      game.player_1_board
    elsif @user == game.player_2
      game.player_2_board
    end
  end
end
