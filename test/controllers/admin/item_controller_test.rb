require "test_helper"

class Admin::ItemControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_item_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_item_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_item_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_item_update_url
    assert_response :success
  end

  test "should get delete" do
    get admin_item_delete_url
    assert_response :success
  end
end
