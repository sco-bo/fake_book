require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @user = users(:scott)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: @user.id
    assert_response :success
  end
end
