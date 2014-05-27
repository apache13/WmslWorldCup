require 'test_helper'

class GenerateControllerTest < ActionController::TestCase
  test "should get bets" do
    get :bets
    assert_response :success
  end

end
