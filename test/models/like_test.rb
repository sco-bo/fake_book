require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  def setup
    @post = posts(:three)
    @like = @post.likes.create(user: users(:zach) )
  end

  test "user likes not empty" do 
    assert_not users(:zach).likes.empty?
  end

  test "post has likes" do 
    assert_not @post.likes.empty?
  end

  test "post has liking users" do 
    assert @post.liking_users.include?(users(:zach))
  end

  test "like belongs to post" do 
    Like.reflect_on_association(:post).macro == :belongs_to
  end

  test "like belongs to user" do 
    Like.reflect_on_association(:user).macro == :belongs_to
  end
end
