require "test_helper"

class Public::GroupMembersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_group_members_new_url
    assert_response :success
  end

  test "should get index" do
    get public_group_members_index_url
    assert_response :success
  end

  test "should get show" do
    get public_group_members_show_url
    assert_response :success
  end

  test "should get create" do
    get public_group_members_create_url
    assert_response :success
  end

  test "should get edit" do
    get public_group_members_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_group_members_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_group_members_destroy_url
    assert_response :success
  end
end
