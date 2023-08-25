require 'test_helper'

class EstimatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get estimates_index_url
    assert_response :success
  end

end
