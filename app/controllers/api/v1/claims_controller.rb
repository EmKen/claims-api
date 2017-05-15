class Api::V1::ClaimsController < Api::V1::ApplicationController
  def index
    claims = current_user.claims
    render json: claims
  end
end
