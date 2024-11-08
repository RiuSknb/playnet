require "test_helper"

class Admin::LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get admin_likes_destroy_url
    assert_response :success
  end
end
