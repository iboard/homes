require_relative '../spec_helper'

describe Address do

  before :each do 
    @person = Person.create firstname: 'Andi', lastname: 'Altendorfer', birthyear: 1964
    @address = Address.create( address: 'Somewhere', zipcode: '1234' )
    @address.housings.create( status: 'Father', person: @person )
  end

  it 'has many people through housings' do
    expect( @address.people.first ).to eq( @person )
  end

  it 'can have more than one person' do
    person = Person.create firstname: 'Heidi', lastname: 'Altendorfer', birthyear: 1969
    @address.housings.create( status: 'Mother', person: person )
    expect( @address.people.count ).to eq(2)
  end

  it 'deletes housing and people on destroy' do
    @address.destroy
    expect( Person.count ).to be_zero
  end

end
