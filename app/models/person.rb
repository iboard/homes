class Person < ActiveRecord::Base

	has_many :housings
	has_many :people, :through => :housings
		
end
