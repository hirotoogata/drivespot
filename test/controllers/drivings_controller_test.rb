require "test_helper"

class DrivingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get drivings_index_url
    assert_response :success
  end

  test "should get new" do
    get drivings_new_url
    assert_response :success
  end

  test "should get create" do
    get drivings_create_url
    assert_response :success
  end

  test "should get edit" do
    get drivings_edit_url
    assert_response :success
  end

  test "should get update" do
    get drivings_update_url
    assert_response :success
  end

  test "should get destroy" do
    get drivings_destroy_url
    assert_response :success
  end

  test "should get show" do
    get drivings_show_url
    assert_response :success
  end
end
