require 'rails_helper'

RSpec.feature "HomePage", type: :feature do
  context 'Going to Website' do
    Steps 'Being Welcomed' do
      Given 'I am on the home page' do
        visit '/'
      end
      Then 'I see a listing of animals header' do
        expect(page).to have_content("Listing Animals")
      end
    end
  end

  context 'I can click to a link that takes me to where I can create an animal' do
    Steps 'Click link' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I can click New animal' do
        click_link 'New Animal'
      end
    end
  end
  # 
  context 'Seeing an animal list' do
    Steps 'Seeing animal list' do
      Given 'I created an animal and return to home page' do
        visit '/'
      end
      Then 'I can see a list of animals' do
        expect(page).to have_table
      end
    end
  end

end
