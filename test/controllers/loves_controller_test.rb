require 'test_helper'

class LovesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get loves_create_url
    assert_response :success
  end

  test "should get destroy" do
    get loves_destroy_url
    assert_response :success
  end

end
