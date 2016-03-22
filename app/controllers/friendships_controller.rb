class FriendshipsController < ApplicationController
  before_action :find_friend

  def accept
    if current_user.requested_friends.include?(@friend)
      Friendship.accept(current_user, @friend)
      flash[:notice] = "Friendship with #{@friend.email} accepted"
    else
      flash[:notice] = "No Friendship request"
    end
    redirect_to root_url
  end

  def decline
    if current_user.requested_friends.include?(@friend)
      Friendship.breakup(current_user, @friend)
      flash[:notice] = "Friendship with #{@friend.email} declined"
    else
      flash[:notice] = "No Friendship request"
    end
    redirect_to root_url
  end

  def delete
    if current_user.friends.include?(@friend)
      Friendship.breakup(current_user, @friend)
      flash[:notice] = "Successfully unfriended #{@friend.email}"
    else
      flash[:notice] = "No Friendship request"
    end
    redirect_to root_url
  end

  def cancel
    if current_user.pending_friends.include?(@friend)
      Friendship.breakup(current_user, @friend)
      flash[:notice] = "Friend request to #{@friend.email} retracted"
    else
      flash[:notice] = "No Friendship request"
    end
    redirect_to root_url
  end

  def create
    Friendship.request(current_user, @friend)
    flash[:notice] = "Friend request sent"
    redirect_to users_index_path
  end

  private
    def find_friend
      @friend = User.find(params[:friend_id])
    end
end
