require "test_helper"

class RemotefilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @remotefile = remotefiles(:one)
  end

  test "should get index" do
    get remotefiles_url
    assert_response :success
  end

  test "should get new" do
    get new_remotefile_url
    assert_response :success
  end

  test "should create remotefile" do
    assert_difference("Remotefile.count") do
      post remotefiles_url, params: { remotefile: {  } }
    end

    assert_redirected_to remotefile_url(Remotefile.last)
  end

  test "should show remotefile" do
    get remotefile_url(@remotefile)
    assert_response :success
  end

  test "should get edit" do
    get edit_remotefile_url(@remotefile)
    assert_response :success
  end

  test "should update remotefile" do
    patch remotefile_url(@remotefile), params: { remotefile: {  } }
    assert_redirected_to remotefile_url(@remotefile)
  end

  test "should destroy remotefile" do
    assert_difference("Remotefile.count", -1) do
      delete remotefile_url(@remotefile)
    end

    assert_redirected_to remotefiles_url
  end
end
