require 'rails_helper'

RSpec.feature "Edits", type: :feature do
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
      Then 'I can edit the animal profile' do
        click_link 'Edit'
      end
      And 'I can update any field on the edit portion' do
        fill_in 'animal_common_name', with: 'dog'
        fill_in 'animal_latin_name', with: 'perro'
        fill_in 'animal_kingdom', with: 'mammal'
      end
      Then 'I click update animal to make the new changes' do
        click_button 'Update Animal'
      end
      And 'I can see the animal content was updated' do
          expect(page).to have_content('Animal was successfully updated.')
      end
    end
  end
end
