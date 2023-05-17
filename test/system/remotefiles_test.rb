require "application_system_test_case"

class RemotefilesTest < ApplicationSystemTestCase
  setup do
    @remotefile = remotefiles(:one)
  end

  test "visiting the index" do
    visit remotefiles_url
    assert_selector "h1", text: "Remotefiles"
  end

  test "should create remotefile" do
    visit remotefiles_url
    click_on "New remotefile"

    click_on "Create Remotefile"

    assert_text "Remotefile was successfully created"
    click_on "Back"
  end

  test "should update Remotefile" do
    visit remotefile_url(@remotefile)
    click_on "Edit this remotefile", match: :first

    click_on "Update Remotefile"

    assert_text "Remotefile was successfully updated"
    click_on "Back"
  end

  test "should destroy Remotefile" do
    visit remotefile_url(@remotefile)
    click_on "Destroy this remotefile", match: :first

    assert_text "Remotefile was successfully destroyed"
  end
end
