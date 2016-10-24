require 'rails_helper'

RSpec.describe Relationship, type: :model do
  def setup
    user = create(:user)
    other_user = create(:user, email: 'user@user.com')
    @relationship = Relationship.new(follower_id: user.id,
                                    followed_id: other_user.id)
  end

  describe 'valid model' do
    it 'should be valid' do
      setup
      expect(@relationship).to be_valid
    end

    it 'should require a follower_id' do
      setup
      @relationship.follower_id = nil
      expect(@relationship).to_not be_valid
    end
    
    it 'should require a followed_id' do
      setup
      @relationship.followed_id = nil
      expect(@relationship).to_not be_valid
    end
  end

end
