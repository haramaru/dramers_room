require "test_helper"

class Public::ShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_shops_show_url
    assert_response :success
  end
end
