require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:scott)
    @other_user = users(:dave)
    @third_user = users(:zach)
  end

  test "user has a post" do 
    assert_not @user.posts.empty?
  end

  test "user does not have a post" do 
    assert @third_user.posts.empty?
  end

  test "user creates a post" do 
    assert_difference '@other_user.posts.count', 1 do 
      @other_user.posts.create(body: "Hi there")
    end
  end

  test "post can have likes" do 
    assert_not posts(:one).likes.empty?
  end

  test "post has no likes" do 
    assert posts(:three).likes.empty?
  end

  test "post belongs to user" do 
    Post.reflect_on_association(:user).macro == :belongs_to
  end

  test "post has many likes" do 
    Post.reflect_on_association(:likes).macro == :has_many
  end
end
