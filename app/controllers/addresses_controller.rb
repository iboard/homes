class AddressesController < ApplicationController

	def index		
		@addresses = Address.all

	end
	
	def new
		@address = Address.new
	end
	
	def create
	
		@address = Address.create address_params
		if @address.valid?
			redirect_to addresses_path
		else
			render :new
		end
	end	
	
	private
	def address_params
		params.require(:address).permit(:address, :zipcode)
	end
	
	
end