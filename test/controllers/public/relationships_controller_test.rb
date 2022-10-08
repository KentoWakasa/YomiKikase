require "test_helper"

class Public::RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get followings" do
    get public_relationships_followings_url
    assert_response :success
  end

  test "should get fllowers" do
    get public_relationships_fllowers_url
    assert_response :success
  end
end
