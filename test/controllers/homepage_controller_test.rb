require 'test_helper'

class HomepageControllerTest < ActionDispatch::IntegrationTest
  test "homepage should load" do
    get root_url
    assert_response :success
  end

end
