require "test_helper"

class Admin::RegionGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_region_genres_index_url
    assert_response :success
  end
end
