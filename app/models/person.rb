class Person < ActiveRecord::Base

	has_one :housing
	has_one :address, :through => :housing
		
end
