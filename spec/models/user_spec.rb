require 'rails_helper'

RSpec.describe User, type: :model do
  def setup
    @user = create(:user)
    @other_user = create(:user, email: 'user@user.com')
  end

  describe 'User model' do
    it 'should follow and unfollow a user' do
      setup
      expect(@user.following?(@other_user)).to eq false
      @user.follow(@other_user)
      expect(@user.following?(@other_user)).to eq true
      expect(@other_user.followers.include?(@user)).to eq true
      @user.unfollow(@other_user)
      expect(@user.following?(@other_user)).to eq false
    end
  end
end
