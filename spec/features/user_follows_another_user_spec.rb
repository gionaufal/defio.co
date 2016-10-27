require 'rails_helper'

feature 'User follows another user' do
  scenario 'successfully' do
    user= create(:user)
    other_user = create(:user, name: 'Other user', username: 'otheruser',
                        email: 'other@user.com', password: 'password123')
    login_as(user)

    visit "/users/#{other_user.username}"
    click_on 'follow'

    expect(page).to have_content '1 follower'
  end
end
