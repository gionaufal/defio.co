class HomeController < ApplicationController
  def index
    if user_signed_in?
      @user = User.find_by_username(current_user.username)
      @posts = Post.order(created_at: :desc).limit(20)
    end
  end
end
