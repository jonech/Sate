require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get loginpage" do
    get :loginpage
    assert_response :success
  end

end
