require "test_helper"

class BookesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bookes_index_url
    assert_response :success
  end

  test "should get show" do
    get bookes_show_url
    assert_response :success
  end

  test "should get edit" do
    get bookes_edit_url
    assert_response :success
  end
end
