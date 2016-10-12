require 'rails_helper'

feature 'User signs in' do
  scenario 'successfully' do
    user = create(:user)

    visit root_path

    within '.right' do
      click_on 'Login'
    end

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_on 'Sign in'

    expect(page).to have_content user.username
    expect(page).not_to have_content 'Login'
  end

  scenario 'and must fill all fields' do
    visit root_path

    within '.right' do
      click_on 'Login'
    end
    click_on 'Sign in'

    expect(page).to have_content 'Invalid Email or password.'
  end
end
