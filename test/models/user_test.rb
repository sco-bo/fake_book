require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "friend request status is 'pending'" do 
    assert users(:scott).pending_friends.include?(users(:dave))
  end

  test "friend request status is 'requested'" do 
    assert users(:dave).requested_friends.include?(users(:scott))
  end

  test "'accepted' status means friends" do 
    assert users(:scott).friends.include?(users(:zach))
    assert users(:zach).friends.include?(users(:scott))
  end

  test "friendship not empty" do 
    assert_not users(:scott).friendships.nil?
  end
end
