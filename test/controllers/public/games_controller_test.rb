require "test_helper"

class Public::GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_games_index_url
    assert_response :success
  end

  test "should get show" do
    get public_games_show_url
    assert_response :success
  end
end
