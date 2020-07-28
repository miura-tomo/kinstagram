require 'test_helper'

class KujisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kujis_index_url
    assert_response :success
  end

end
