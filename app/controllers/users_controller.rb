class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "User logged in!"
      redirect_to root_path
    else
      flash[:danger] =  "Credentials Invalid"
      redirect_to root_path
    end
  end

  def comments
    @user_posts = Post.where(user_id: current_user.id)
    @user_comments = Comment.where(user_id: current_user.id )
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
