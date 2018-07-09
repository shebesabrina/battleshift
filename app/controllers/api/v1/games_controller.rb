module Api
  module V1
    class GamesController < ActionController::API
      def show
        if game ||= Game.find_by_id(params[:id])
          render json: game
        else
          render status:400
        end
      end
    end
  end
end
