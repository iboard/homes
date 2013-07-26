class AddressesController < ApplicationController

	def index		
		@addresses = Address.all

	end
	
	def new
		@address = Address.new
		3.times {@address.people.build}
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
		@address.delete
		redirect_to addresses_path
	end
	

	
	
	private
	def address_params
		params.require(:address).permit(:address, :zipcode, people_attributes: [ :id, :firstname, :lastname, :birthyear ], housings_attribures: [ :id, :status, :address_id, :person_id ])
	end
	
	
end