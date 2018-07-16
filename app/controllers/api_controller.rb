class ApiController < ActionController::API
  before_action :api_auth

  def api_auth
    if header_api_key && set_user
    else
      render json: ("Error").to_json, message: StandardError.new("Invalid Api Token"), status: 400
    end
  end

  def header_api_key
    request.headers["HTTP_X_API_KEY"]
  end

  def set_user
    @user = User.find_by(api_token: header_api_key)
  end
end
