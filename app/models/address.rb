class Address < ActiveRecord::Base

	has_many :housings
	has_many :people, :through => :housings
	accepts_nested_attributes_for :people
	accepts_nested_attributes_for :housings

end
