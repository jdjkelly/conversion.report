require 'test_helper'

class ConversionsControllerTest < ActionController::TestCase
  setup do
    @conversion = conversions(:one)
    sign_in_as(users(:billy))
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conversions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conversion" do
    assert_difference('Conversion.count') do
      post :create, conversion: { browser: @conversion.browser, host: @conversion.host, ip_address: @conversion.ip_address, os: @conversion.os, user_agent: @conversion.user_agent }
    end

    assert_redirected_to conversion_path(assigns(:conversion))
  end

  test "should show conversion" do
    get :show, id: @conversion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @conversion
    assert_response :success
  end

  test "should not be able to update a conversion" do
    assert_raise(ActionController::UrlGenerationError) do
      patch :update, id: @conversion, conversion: { browser: @conversion.browser, host: @conversion.host, ip_address: @conversion.ip_address, os: @conversion.os, user_agent: @conversion.user_agent }
    end
  end

  test "should not be able to destroy a conversion" do
    assert_raise(ActionController::UrlGenerationError) do
      delete :destroy, id: @conversion
    end
  end
end
