require 'rails_helper'

RSpec.feature "Destroys", type: :feature do
  context 'Creating a new animal' do
    Steps 'Creating an animal' do
      Given 'I am on the create animal page' do
        visit '/animals/new'
      end
      Then 'I fill in the common name, latin name, and kingdom' do
         fill_in 'animal_common_name', with: 'cat'
         fill_in 'animal_latin_name', with: 'big cat'
         fill_in 'animal_kingdom', with: 'lion king'
      end
      And 'I press the create animal button' do
        click_button 'Create Animal'
      end
      And 'I can see content on page' do
        expect(page).to have_content('Animal was successfully created.')
      end
      Then 'I can click back to take me to the homepage' do
        click_link 'Back'
      end
      And 'I can destroy an aminal profile on the homepage' do
        click_link 'Destroy'
      end
      Then 'I can see an alert confirming the destroy' do
          expect(page).to have_content('Animal was successfully destroyed.')
      end
    end
  end
end
