require "test_helper"

class Api::V1::FeedbacksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_feedbacks_create_url
    assert_response :success
  end
end
