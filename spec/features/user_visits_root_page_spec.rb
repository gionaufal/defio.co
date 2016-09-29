require 'rails_helper'

feature 'User visits root path' do
  scenario 'successfully' do
    visit root_path
    
    expect(page).to have_content 'Defio'
    expect(page).to have_content 'Log In'
    expect(page).to have_content 'What is Defio?'
    expect(page).to have_content 'Join the challenge'
  end 
end
