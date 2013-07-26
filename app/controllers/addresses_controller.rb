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
	
	def edit
		@address= Address.find params[:id]
	end
	
	def update
		@address = Address.find params[:id]
		if @address.update_attributes(address_params)
			redirect_to addresses_path
		else
			render :edit
		end	
	end
	
	def destroy
		@address= Address.find params[:id]
		@address.destroy
		redirect_to addresses_path
	end
	

	
	
	private
	def address_params
		params.require(:address).permit!
	end
	
	
end
