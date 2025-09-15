class Api::V1::OrganizationsController < ApplicationController
  before_action :authenticate_request

  def index
    @organizations = Organization.all
    render json: @organizations
  end
  def create
    @organization = Organization.new(organization_params)
    @organization.user_id = @current_user.id
    @organization.verified = "pending"
    if @organization.save
      render json: { message: "Organization created successfully!" }, status: :created
    else
      render json: { errors: @organization.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @organization.update(organization_params)
      render json: { message: "Organization updated successfully!" }, status: :ok
    else
      render json: { errors: @organization.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @organization.destroy
    render json: { message: "Organization deleted successfully!" }, status: :ok
  end

  def show
    render json: @organization
  end

  private

  def organization_params
    params.permit(:name, :cnpj, :verified, :phone, :address)
  end

end
