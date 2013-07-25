class Housing < ActiveRecord::Base

	belongs_to :person
	belongs_to :address
	
end
