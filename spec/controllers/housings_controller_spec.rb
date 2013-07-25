require_relative "../spec_helper"

describe HousingsController do

	render_views
	
	before :each do
		Person.create firstname:"John", lastname:"Smith" , birthyear: 1966
		Person.create firstname:"Jane", lastname:"Smith" , birthyear: 1969
		Person.create firstname:"Jones", lastname:"Smith" , birthyear: 1988
		Person.create firstname:"Joanne", lastname:"Smith" , birthyear: 1993
		Address.create address:"1 Main Street, Washington DC, USA", zipcode: 15
		Housing.create address_id:1 , person_id: 2 , status: "mother"

		visit '/housings'

	end

	
	
end