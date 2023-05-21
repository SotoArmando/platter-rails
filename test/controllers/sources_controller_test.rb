require "test_helper"

class SourcesControllerTest < ActionDispatch::IntegrationTest
  test "should get request" do
    get sources_request_url
    assert_response :success
  end
end
