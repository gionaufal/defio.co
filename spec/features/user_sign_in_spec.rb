require 'rails_helper'

feature 'User signs in' do
  scenario 'successfully' do
    user = create(:user)

    visit root_path

    click_on 'Login'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_on 'Sign in'

    expect(page).to have_content user.username
    expect(page).not_to have_content 'Login'
  end

  scenario 'and must fill all fields' do
    visit root_path

    click_on 'Login'

    click_on 'Sign in'

    expect(page).to have_content 'Invalid Email or password.'
  end
end
