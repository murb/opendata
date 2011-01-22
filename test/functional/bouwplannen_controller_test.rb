require 'test_helper'

class BouwplannenControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bouwplannen)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bouwplan" do
    assert_difference('Bouwplan.count') do
      post :create, :bouwplan => { }
    end

    assert_redirected_to bouwplan_path(assigns(:bouwplan))
  end

  test "should show bouwplan" do
    get :show, :id => bouwplannen(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => bouwplannen(:one).to_param
    assert_response :success
  end

  test "should update bouwplan" do
    put :update, :id => bouwplannen(:one).to_param, :bouwplan => { }
    assert_redirected_to bouwplan_path(assigns(:bouwplan))
  end

  test "should destroy bouwplan" do
    assert_difference('Bouwplan.count', -1) do
      delete :destroy, :id => bouwplannen(:one).to_param
    end

    assert_redirected_to bouwplannen_path
  end
end
