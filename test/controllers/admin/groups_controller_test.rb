require "test_helper"

class Admin::GroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_groups_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_groups_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_groups_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_groups_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_groups_destroy_url
    assert_response :success
  end
end
