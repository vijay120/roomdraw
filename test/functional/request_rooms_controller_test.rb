require 'test_helper'

class RequestRoomsControllerTest < ActionController::TestCase
  setup do
    @request_room = request_rooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:request_rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request_room" do
    assert_difference('RequestRoom.count') do
      post :create, request_room: @request_room.attributes
    end

    assert_redirected_to request_room_path(assigns(:request_room))
  end

  test "should show request_room" do
    get :show, id: @request_room.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request_room.to_param
    assert_response :success
  end

  test "should update request_room" do
    put :update, id: @request_room.to_param, request_room: @request_room.attributes
    assert_redirected_to request_room_path(assigns(:request_room))
  end

  test "should destroy request_room" do
    assert_difference('RequestRoom.count', -1) do
      delete :destroy, id: @request_room.to_param
    end

    assert_redirected_to request_rooms_path
  end
end
