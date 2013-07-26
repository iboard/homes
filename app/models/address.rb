class Address < ActiveRecord::Base
	
	has_many :housings
	has_many :people, :through => :housings
	accepts_nested_attributes_for :housings, allow_destroy: true

  after_destroy :clean_up

  private
  def clean_up
    self.housings.each do |housing|
      housing.person.delete
      housing.delete
    end
  end

end
