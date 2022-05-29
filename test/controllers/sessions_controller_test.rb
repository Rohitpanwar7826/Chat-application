require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get logged_in" do
    get sessions_logged_in_url
    assert_response :success
  end
end
