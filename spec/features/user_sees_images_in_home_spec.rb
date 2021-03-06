require 'rails_helper'

feature 'User sees images in home' do
  scenario 'successfully' do
    user = create(:user)
    login_as(user)

    visit root_path

    within '.right' do
      click_on 'New post'
    end
    post = build(:post, user: user)

    fill_in 'Description', with: post.description
    attach_file('post_image', 'app/assets/images/inktober.png')

    click_on 'Create post'

    visit root_path
    expect(page).to have_css("img[src*='inktober.png']")
    expect(page).to have_content post.description
  end
end
