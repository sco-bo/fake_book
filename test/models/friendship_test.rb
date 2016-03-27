require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  def setup
    @user = users(:scott)
    @other_user = users(:dave)
    @third_user = users(:zach)
  end
# friendship creation? 
  test "user can accept a friend request" do
    assert_not Friendship.exists?(@other_user, @third_user)
    Friendship.request(@third_user, @other_user)
    Friendship.accept(@other_user, @third_user)
    assert @other_user.friends.include?(@third_user)
    assert @third_user.friends.include?(@other_user)
  end

  test "user can decline a friend request" do
    assert_not Friendship.exists?(@other_user, @third_user)
    Friendship.request(@other_user, @third_user)
    assert @third_user.requested_friends.include?(@other_user)
    assert @other_user.pending_friends.include?(@third_user)
    Friendship.breakup(@third_user, @other_user)
    assert_not @other_user.pending_friends.include?(@third_user)
    assert_not @third_user.requested_friends.include?(@other_user)
  end

  test "user can cancel a friend request" do
    assert_not Friendship.exists?(@third_user, @other_user)
    Friendship.request(@third_user, @other_user)
    assert @third_user.pending_friends.include?(@other_user)
    Friendship.breakup(@third_user, @other_user)
    assert_not @third_user.pending_friends.include?(@other_user)
  end

  test "user can un-friend another user" do 
    assert_not Friendship.exists?(@third_user, @other_user)
    Friendship.request(@other_user, @third_user)
    Friendship.accept(@third_user, @other_user)
    assert @third_user.friends.include?(@other_user)
    assert @other_user.friends.include?(@third_user)
    Friendship.breakup(@third_user, @other_user)
    assert_not @third_user.friends.include?(@other_user)
    assert_not @other_user.friends.include?(@third_user)
  end
end
