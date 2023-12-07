class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @posts = Post.all
  end

  def show
    @post = set_post
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
    @post = set_post
    @post.destroy
    redirect_to posts_path, notice: "Post was successfully deleted"
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :photo)
  end

  def set_post
    Post.find(params[:id])
  end
end
