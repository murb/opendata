require 'test_helper'

class ContactMailsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_mails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact_mail" do
    assert_difference('ContactMail.count') do
      post :create, :contact_mail => { }
    end

    assert_redirected_to contact_mail_path(assigns(:contact_mail))
  end

  test "should show contact_mail" do
    get :show, :id => contact_mails(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => contact_mails(:one).to_param
    assert_response :success
  end

  test "should update contact_mail" do
    put :update, :id => contact_mails(:one).to_param, :contact_mail => { }
    assert_redirected_to contact_mail_path(assigns(:contact_mail))
  end

  test "should destroy contact_mail" do
    assert_difference('ContactMail.count', -1) do
      delete :destroy, :id => contact_mails(:one).to_param
    end

    assert_redirected_to contact_mails_path
  end
end
