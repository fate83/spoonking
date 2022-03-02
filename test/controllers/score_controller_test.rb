require "test_helper"

class ScoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get score_index_url
    assert_response :success
  end
end
