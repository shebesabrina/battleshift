class Api::V1::Games::ShotsController < ApiController
  before_action :check_turn
  def create
   

    turn_processor = TurnProcessor.new(@game, params[:shot][:target])
    turn_processor.run!
    render json: @game, message: turn_processor.message, status: turn_processor.status
  end

  private
  
  def check_turn
    @game = Game.find(params[:game_id])
    if @game.current_turn == "player_1" && @game.player_1 == @user || @game.current_turn == "player_2" && @game.player_2 == @user
    else
      render json: @game, status: 400, message: "Invalid move. It's your opponent's turn"
    end
  end

end