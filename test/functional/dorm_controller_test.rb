require 'test_helper'

class DormControllerTest < ActionController::TestCase
  test "should get north" do
    get :north
    assert_response :success
  end

  test "should get south" do
    get :south
    assert_response :success
  end

  test "should get east" do
    get :east
    assert_response :success
  end

  test "should get west" do
    get :west
    assert_response :success
  end

  test "should get atwood" do
    get :atwood
    assert_response :success
  end

  test "should get sontag" do
    get :sontag
    assert_response :success
  end

  test "should get linde" do
    get :linde
    assert_response :success
  end

  test "should get case" do
    get :case
    assert_response :success
  end

end
