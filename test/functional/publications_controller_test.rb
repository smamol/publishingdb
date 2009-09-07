require 'test_helper'

class PublicationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:publications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create publications" do
    assert_difference('Publications.count') do
      post :create, :publications => { }
    end

    assert_redirected_to publications_path(assigns(:publications))
  end

  test "should show publications" do
    get :show, :id => publications(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => publications(:one).to_param
    assert_response :success
  end

  test "should update publications" do
    put :update, :id => publications(:one).to_param, :publications => { }
    assert_redirected_to publications_path(assigns(:publications))
  end

  test "should destroy publications" do
    assert_difference('Publications.count', -1) do
      delete :destroy, :id => publications(:one).to_param
    end

    assert_redirected_to publications_path
  end
end
