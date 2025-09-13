class Api::V1::UsersController < ApplicationController
  before_action :authenticate_request

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
  @user = User.new(user_params)

  if @user.save
    render json: { message: "User created successfully!" }, status: :created
  else
    render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
  end
end

# Adicione outras ações como `show` e `update` aqui

private

def user_params
  params.permit(:name, :email, :password, :phone, :address, :address_number, :neighborhood, :city, :state, :document_number, :user_type)
end
end
