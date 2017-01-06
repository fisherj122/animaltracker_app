require 'rails_helper'

RSpec.feature "CSightings", type: :feature do
  context 'Creating a Sighting' do
    Steps 'Add new sighting' do
      Given 'I am on the create List Sighting Page' do
        visit '/sightings'
      end
      Then 'Click new sighting' do
        click_link 'New Sighting'
      end
      And 'Expect to see New Sightings form' do
        expect(page).to have_content 'New Sighting'
      end
      Then 'I can fill in the sighting form' do
        select '2017', :from => 'sighting_date_1i'
        select 'January', :from => 'sighting_date_2i'
        select '5', :from => 'sighting_date_3i'
        select '23', :from => 'sighting_date_4i'
        select '42', :from => 'sighting_date_5i'
        fill_in 'sighting_latitude', with: '54'
        fill_in 'sighting_longitude', with: '44'
      end
      And 'I can press the create sighting button' do
        click_button 'Create Sighting'
      end
      Then 'I expect to see a confirmation on sighting' do
        expect(page).to have_content('Sighting was successfully created')
      end
    end
  end
end
