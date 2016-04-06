class PostsController < ApplicationController
  require 'will_paginate/array'

  def index
    @post = current_user.posts.build
    @all_posts = (Post.where(user: current_user.friends) + Post.where(user: current_user)).sort_by(&:created_at).reverse
    @posts = @all_posts.paginate(page: params[:page], per_page: 15)
    respond_to do |format|
      format.html
      format.js
    end
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
      redirect_to :back
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
      params.require(:post).permit(:body, :photo)
    end
end
