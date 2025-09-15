class Api::V1::AdoptionsController < ApplicationController
  before_action :authenticate_request

  def index
    @adoptions = Adoption.all
    render json: @adoptions
  end

  def show
    render json: @adoption
  end

  def create
    @adoption = Adoption.new(adoption_params)
    @adoption.user_id = @current_user.id
    
    @adoption.status = "pending"
    if @adoption.save
      render json: { message: "Adoption created successfully!" }, status: :created
    else
      render json: { errors: @adoption.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @adoption.update(adoption_params)
      render json: { message: "Adoption updated successfully!" }, status: :ok
    else
      render json: { errors: @adoption.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @adoption.destroy
    render json: { message: "Adoption deleted successfully!" }, status: :ok
  end

  private

  def adoption_params
    params.require(:adoption).permit(:animal_id, :status, form_data: {})
  end
end
