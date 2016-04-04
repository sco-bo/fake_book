class UsersController < ApplicationController
  def index
    @post = current_user.posts.build
    @users = User.all
  end

  def show
    @post = current_user.posts.build
    @user = User.find_by_name(params[:id])
  end
end
