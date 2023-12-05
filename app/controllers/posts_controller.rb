class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path, notice: "Post was successfully created"
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
    redirect_to posts_path, notice: "Post was successfully deleted"
    else
      render :index
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
