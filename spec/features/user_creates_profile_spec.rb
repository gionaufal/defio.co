require 'rails_helper'

feature 'User creates profile' do
  scenario 'successfully' do
    user = build(:user)

    visit root_path

    click_on 'Sign Up'

    fill_in 'Name',                       with: user.name
    fill_in 'Email',                      with: user.email
    fill_in 'Username',                   with: user.username
    fill_in 'Password',                   with: user.password, match: :prefer_exact
    fill_in 'Confirm your password',      with: user.password, match: :prefer_exact

    click_on 'Sign up'

    expect(page).to have_content user.username
    expect(page).not_to have_content 'Log in'
    expect(current_path).to eq root_path
  end
end
