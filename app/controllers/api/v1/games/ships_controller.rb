class Api::V1::Games::ShipsController < ApiController

  def create
    ship = Ship.new(params["ship_size"])
    game = @user.games.find(params["game_id"])
    placer = ShipPlacer.new(board: game.player_1_board, ship: ship, start_space: params["start_space"], end_space: params["end_space"])
    placer.run
    game.save
    render json: game, status: 200, message: placer.message
  end
end
