require "test_helper"

class ScoreControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get index" do
    @user = users(:one)
    sign_in(@user)
    get top10_url
    assert_response :success
  end
end
