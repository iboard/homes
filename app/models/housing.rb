class Housing < ActiveRecord::Base

	belongs_to :person
	belongs_to :address
	
	accepts_nested_attributes_for :person, allow_destroy: true
end
