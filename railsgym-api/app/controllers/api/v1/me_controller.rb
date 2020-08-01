class Api::V1::MeController < ActionController::API
  include Knock::Authenticable

  def show
    render json: current_user
  end
end
