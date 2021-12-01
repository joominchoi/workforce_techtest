require "test_helper"

class ShiftsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get '/sign_up'
    assert_response :success
  end
end
