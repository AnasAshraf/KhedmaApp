require 'test_helper'

class PendingItemRequestsControllerTest < ActionController::TestCase
  setup do
    @pending_item_request = pending_item_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pending_item_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pending_item_request" do
    assert_difference('PendingItemRequest.count') do
      post :create, pending_item_request: {  }
    end

    assert_redirected_to pending_item_request_path(assigns(:pending_item_request))
  end

  test "should show pending_item_request" do
    get :show, id: @pending_item_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pending_item_request
    assert_response :success
  end

  test "should update pending_item_request" do
    patch :update, id: @pending_item_request, pending_item_request: {  }
    assert_redirected_to pending_item_request_path(assigns(:pending_item_request))
  end

  test "should destroy pending_item_request" do
    assert_difference('PendingItemRequest.count', -1) do
      delete :destroy, id: @pending_item_request
    end

    assert_redirected_to pending_item_requests_path
  end
end
