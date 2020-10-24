require 'test_helper'

class HomepageControllerTest < ActionDispatch::IntegrationTest
  test "should get greeting" do
    get homepage_greeting_url
    assert_response :success
  end

end
