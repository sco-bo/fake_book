class FriendshipsController < ApplicationController
  # def index
  #   @user = User.find(params[:id])
  #   @friendship = @user.friendships 
  # end

  # def update
  #   @user = User.find(params[:id])
  #   @friendship = @user.friendships.find(params[:id])
  #   # @friendship.accept()
  # end

  # def destroy
  # end

  def accept
    @friend = User.find(params[:friend_id])
    if current_user.requested_friends.include?(@friend)
      Friendship.accept(current_user, @friend)
      flash[:notice] = "Friendship accepted"
    else
      flash[:notice] = "No Friendship request"
    end
    redirect_to root_url
  end

  def create
    @friend = User.find(params[:friend_id])
    Friendship.request(current_user, @friend)
    redirect_to users_index_path
  end
end
