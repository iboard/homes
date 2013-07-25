require_relative '../spec_helper'

describe PeopleController do

	render_views
	before :each do
		Person.create firstname:"John", lastname:"Smith" , birthyear: 1966
		Person.create firstname:"Jane", lastname:"Smith" , birthyear: 1969
		Person.create firstname:"Jones", lastname:"Smith" , birthyear: 1988
		Person.create firstname:"Joanne", lastname:"Smith" , birthyear: 1993
		visit '/people'

	end

	it "should display a message" do
		page.should have_content("Hello")
	end

	it "should display a list of people" do
	
		page.should have_content("John Smith")
	
	end
	
end