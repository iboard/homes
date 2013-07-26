require_relative '../spec_helper'

describe AddressesController do

  render_views

  before :each do
    Address.create address: '1 Main Street, Washington DC, USA', zipcode: 15
    visit "/addresses"
  end

  it "should display a message" do
    visit '/addresses'
    page.should have_content("Addresses")
  end

end
