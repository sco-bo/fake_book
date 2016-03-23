module FriendshipsHelper

  def friend_request? 
    !current_user.requested_friends.nil?
  end
end
