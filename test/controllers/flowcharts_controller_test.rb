require "test_helper"

class FlowchartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get flowcharts_index_url
    assert_response :success
  end
end
