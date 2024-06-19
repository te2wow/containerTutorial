require "test_helper"

class RandomStringControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get random_string_show_url
    assert_response :success
  end
end
