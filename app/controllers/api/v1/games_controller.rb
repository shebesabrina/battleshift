class Api::V1::GamesController < ActionController::API
  def show
    if game ||= Game.find_by_id(params[:id])
      render json: game
    else
      render status:400
    end
  end
end
