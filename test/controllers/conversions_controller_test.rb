require 'test_helper'

class ConversionsControllerTest < ActionController::TestCase
  setup do
    @conversion = conversions(:one)
    sign_in_as(users(:billy))
  end

  test "should create conversion" do
    assert_difference('Conversion.count') do
      post :create, conversion: { browser: @conversion.browser,
                                  host: @conversion.host,
                                  ip_address: @conversion.ip_address,
                                  os: @conversion.os,
                                  user_agent: @conversion.user_agent }, format: 'json'
    end

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
