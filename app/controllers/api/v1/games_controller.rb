class Api::V1::GamesController < ApiController

  def create
    find_opponent
    player_1_board = Board.new
    player_2_board = Board.new
    game = @user.games.find_or_create_by(player_1_board: player_1_board, player_2_board: player_2_board, player_1_turns: 0, player_2_turns: 0, current_turn: "player_1", winner: nil)
    game.participants.find_or_create_by(user: @opponent, role: 1)

    if game
      puts 'game success'
      render json: game
    else
      puts 'error'
      render json: error
    end
  end

  def show
    if game ||= Game.find_by_id(params[:id])
      render json: game
    else
      render status:400
    end
  end

  private

  def find_opponent
    render :error unless opp_email && set_opp
  end

  def opp_email
    params["opponent_email"]
  end

  def set_opp
    @opponent = User.find_by_email(opp_email)
  end

end
