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

	private
	def person_params
		#params.require(:person).permit(:firstname, :lastname, :birthyear) 
		params.require(:person).permit!
	end

end