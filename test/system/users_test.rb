require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "visiting login page" do
    visit new_session_url

    assert_element "input", name: "email_address"
  end
end
