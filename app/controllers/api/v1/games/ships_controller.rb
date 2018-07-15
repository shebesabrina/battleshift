class Api::V1::ShipsController < ApiController

  def create
    #check to see if ship was placed Successfully
      # if board.run

      # binding.prxy
      # @user.games.first.player_1_board.board[0].first["A1"]
      # ship_spaces = @user.games.find(params["game_id"]).player_1_board.get_spaces_between(params["start_space"], params["end_space"])
      ship = Ship.new(params["ship_size"])
      placer = ShipPlacer.new(@user.games.find(params["game_id"]).player_1_board, ship, params["start_space"], params["end_space"]).run
      render json: @user.games.find(params["game_id"]), status: 200, message: "Successfully placed ship with a size of #{params["ship_size"]}. You have 1 ship(s) to place with a size of #{ship}."
      # else
      # render json: #{body: "You're done. Ships have been placed."} status: :bad_request if ships have all been placed whether it's a 2 ship or 3 ship length
      #raise the error message in the ship_placer.
    # end
  end
end
