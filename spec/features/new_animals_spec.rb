require 'rails_helper'

RSpec.feature "NewAnimals", type: :feature do
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
    end

  end
end
