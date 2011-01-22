require 'test_helper'

class PuttenControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:puts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create put" do
    assert_difference('Put.count') do
      post :create, :put => { }
    end

    assert_redirected_to put_path(assigns(:put))
  end

  test "should show put" do
    get :show, :id => puts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => puts(:one).to_param
    assert_response :success
  end

  test "should update put" do
    put :update, :id => puts(:one).to_param, :put => { }
    assert_redirected_to put_path(assigns(:put))
  end

  test "should destroy put" do
    assert_difference('Put.count', -1) do
      delete :destroy, :id => puts(:one).to_param
    end

    assert_redirected_to putten_path
  end
end
