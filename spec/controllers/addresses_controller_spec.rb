require_relative '../spec_helper'

describe AddressesController do

  render_views

  before :each do
    Address.create address: '1 Main Street, Washington DC, USA', zipcode: 15
    visit "/addresses"
  end

  it 'should list existing addresses' do
    page.should have_content('Addresses')
    page.should have_content('1 Main Street')
  end

  it 'offers an add address link' do
    page.should have_link 'Add new household'
  end

  describe 'Adding household', js: true do

    before :each do
      click_link 'Add new household'
      fill_in 'Address', with: 'Somewhere'
      fill_in 'Zipcode', with: '123456'
    end

    it 'renders a form new address' do
      page.should have_field 'Address'
      page.should have_field 'Zipcode'
    end

    describe 'Adding a person' do

      before :each do 
        click_link 'Add Person'
      end

      it 'dynamicly adds fields for person' do
        page.should have_field 'Status'
        page.should have_field 'Firstname'
        page.should have_field 'Lastname'
        page.should have_field 'Birthyear'
      end

      it 'creates housing and person' do
        fill_in 'Status',    with: 'Uncle'
        fill_in 'Firstname', with: 'Bob'
        fill_in 'Lastname',  with: 'Martin'
        fill_in 'Birthyear', with: '1960'
        click_button 'Save'
          page.should have_content 'Somewhere'
          page.should have_content '123456'
          page.should have_content 'Uncle'
          page.should have_content 'Bob'
          page.should have_content 'Martin'
      end

    end
  end

end
