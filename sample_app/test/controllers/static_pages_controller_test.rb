require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url # use a get request and the url
    assert_response :success  # show true if the response is valid
    assert_select "title", "Home | Ruby on Rails Tutorial Sample App"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help | Ruby on Rails Tutorial Sample App"
  end

  test "should get about" do
      get static_pages_about_url
      assert_response :success
      assert_select "title", "About | Ruby on Rails Tutorial Sample App"
  end
end
