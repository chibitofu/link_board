class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: current_user.id)
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :link)
  end

end
