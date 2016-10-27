class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:id])
    @posts = Post.where(user_id: @user.id)
  end

  def following
    @title = 'Following'
    @user = User.find_by(username: params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end
  
  def followers
    @title = 'Followers'
    @user = User.find_by(username: params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
end
