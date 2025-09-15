require "test_helper"

class Api::V1::OrganizationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_organizations_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_organizations_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_organizations_destroy_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_organizations_show_url
    assert_response :success
  end

  test "should get index" do
    get api_v1_organizations_index_url
    assert_response :success
  end
end
