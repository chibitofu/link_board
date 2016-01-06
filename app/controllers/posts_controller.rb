class PostsController < ApplicationController
  def index
    if current_user
      @posts = Post.all()
    end
  end

  def new

  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to root_path
  end

  def destroy
    postDelete = Post.find(params[:id])
    postDelete.destroy
  end

  def comment

  end

  private

  def post_params
    params.require(:post).permit(:title, :link)
  end

end
