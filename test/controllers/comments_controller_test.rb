require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get comments_create_url
    assert_response :success
  end

  test "should get index" do
    get comments_index_url
    assert_response :success
  end
end
