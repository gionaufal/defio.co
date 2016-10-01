require 'rails_helper'

feature 'User posts image' do
  scenario 'successfully' do
    user = create(:user)
    login_as(user)

    visit root_path

    click_on 'New post'

    post = build(:post, user: user)

    fill_in 'Description',      with: post.description
    attach_file('post_image', 'app/assets/images/inktober.png')

    click_on 'Create post'

    expect(page).to have_content post.description
    expect(page).to have_css("img[src*='inktober.png']")
  end

  scenario 'and must fill all fields' do
    user = create(:user)
    login_as(user)

    visit root_path

    click_on 'New post'

    post = build(:post, user: user)

    click_on 'Create post'

    expect(page).to have_content "Don't forget to upload the image!"
  end

end
