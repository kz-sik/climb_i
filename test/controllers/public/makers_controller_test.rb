require "test_helper"

class Public::MakersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_makers_index_url
    assert_response :success
  end

  test "should get create" do
    get public_makers_create_url
    assert_response :success
  end

  test "should get edit" do
    get public_makers_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_makers_update_url
    assert_response :success
  end
end
