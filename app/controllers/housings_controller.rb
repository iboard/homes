class HousingsController < ApplicationController

	def index		
		@housings = Housing.all

	end
	
	def new
		@housing = Housing.new
	end
	
	def create
	
		@housing = Housing.create housing_params
		if @housing.valid?
			redirect_to housings_path
		else
			render :new
		end
	end	
	
	private
	def housing_params
		params.require(:housing).permit(:address_id, :person_id, :status)
	end
	
	
end