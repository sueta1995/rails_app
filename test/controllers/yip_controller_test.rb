require "test_helper"

class YipControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get yip_index_url
    assert_response :success
  end
end
