require "test_helper"

class Public::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get public_sessions_destroy_url
    assert_response :success
  end
end
