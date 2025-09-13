class Api::V1::HomeController < ApplicationController
	before_action :authenticate_request
	
	def index
		render json: { message: 'Welcome to AdotePet API!' }
	end
end