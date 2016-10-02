class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post
    else
      flash[:error] = "Don't forget to upload the image!"
      render :new
    end

  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Your post was deleted'
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :description)
  end
end
