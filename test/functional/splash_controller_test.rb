require 'test_helper'

class SplashControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get theboxes" do
    get :theboxes
    assert_response :success
  end

  test "should get pricing" do
    get :pricing
    assert_response :success
  end

end
