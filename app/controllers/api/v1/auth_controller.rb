class Api::V1::AuthController < ApplicationController
  def login
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      # Geração do token JWT
      payload = { user_id: user.id }
      token = JWT.encode(payload, Rails.application.secret_key_base)
      render json: { token: token }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
end