class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:id])
    @posts = Post.where(user_id: @user.id)
  end
end
