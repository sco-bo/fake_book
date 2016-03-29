class PostsController < ApplicationController
  def index
    @post = current_user.posts.build
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :back
  end

  private
    def post_params
      params.require(:post).permit(:body)
    end
end
