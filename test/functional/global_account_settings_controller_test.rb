require 'test_helper'

class GlobalAccountSettingsControllerTest < ActionController::TestCase
  setup do
    @global_account_setting = global_account_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:global_account_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create global_account_setting" do
    assert_difference('GlobalAccountSetting.count') do
      post :create, :global_account_setting => @global_account_setting.attributes
    end

    assert_redirected_to global_account_setting_path(assigns(:global_account_setting))
  end

  test "should show global_account_setting" do
    get :show, :id => @global_account_setting.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @global_account_setting.to_param
    assert_response :success
  end

  test "should update global_account_setting" do
    put :update, :id => @global_account_setting.to_param, :global_account_setting => @global_account_setting.attributes
    assert_redirected_to global_account_setting_path(assigns(:global_account_setting))
  end

  test "should destroy global_account_setting" do
    assert_difference('GlobalAccountSetting.count', -1) do
      delete :destroy, :id => @global_account_setting.to_param
    end

    assert_redirected_to global_account_settings_path
  end
end
