require "test_helper"

class DiggingControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
  end

  test "confirmed user can see home page after login" do
    get user_session_path
    assert_equal 200, status
    post user_session_path, params: { 'user[email]' => @user.email, 'user[password]' => "helloworld" }
    follow_redirect!

    assert_equal 200, status
    assert_equal "/", path
  end

  test "increase amount of sand after dig" do
    sign_in(@user)
    assert_changes -> { @user.sand } do
      post dig_url, xhr: true
    end
    assert_response :success
  end
end
