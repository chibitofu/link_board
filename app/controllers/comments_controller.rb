class CommentsController < ApplicationController
  def new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:id]
    @comment.save
    redirect_to root_path
  end

  def edit
  end

  def destroy
  end

  def index
    @comments = Comment.all()
  end

  def show
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
