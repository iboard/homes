class PeopleController < ApplicationController

	def index
		@people = Person.all
	end
	
	def new
		
		@person = Person.new
		
	end
	
	def create
	
		@person = Person.create person_params
		if @person.valid?
			redirect_to people_path
		else
			render :new
		end
	end	
	
	
	def destroy
		@person= Person.find params[:id]
		@person.delete
		redirect_to people_path
	end
	
	def edit
		@person= Person.find params[:id]
	end
	
	def update
		@person = Person.find params[:id]
		if @person.update_attributes(person_params)
			redirect_to people_path
		else
			render :edit
		end	
	end
	

	private
	def person_params
		#params.require(:person).permit(:firstname, :lastname, :birthyear) 
		params.require(:person).permit!
	end

end