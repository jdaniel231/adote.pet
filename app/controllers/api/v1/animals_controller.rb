class Api::V1::AnimalsController < ApplicationController
  before_action :authenticate_request

  def index
    @animals = Animal.all
    render json: @animals
  end

  def show
    render json: @animal
  end

  def create
    @animal = Animal.new(animal_params)

    if @animal.save
      render json: { message: "Animal created successfully!" }, status: :created
    else
      render json: { errors: @animal.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @animal.update(animal_params)
      render json: { message: "Animal updated successfully!" }, status: :ok
    else
      render json: { errors: @animal.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @animal.destroy
    render json: { message: "Animal deleted successfully!" }, status: :ok
  end

  private

  def animal_params
    params.permit(:name, :specie, :status, :breed, :description, :photo, :organization_id)
  end
end
