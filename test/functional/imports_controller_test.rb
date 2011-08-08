require 'test_helper'

class ImportsControllerTest < ActionController::TestCase
  setup do
    @import = imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create import" do
    assert_difference('Import.count') do
      post :create, import: @import.attributes
    end

    assert_redirected_to import_path(assigns(:import))
  end

  test "should show import" do
    get :show, id: @import.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @import.to_param
    assert_response :success
  end

  test "should update import" do
    put :update, id: @import.to_param, import: @import.attributes
    assert_redirected_to import_path(assigns(:import))
  end

  test "should destroy import" do
    assert_difference('Import.count', -1) do
      delete :destroy, id: @import.to_param
    end

    assert_redirected_to imports_path
  end
end
