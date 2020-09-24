require 'test_helper'

class TutorialControllerTest < ActionDispatch::IntegrationTest
  test "should get step1" do
    get tutorial_step1_url
    assert_response :success
  end

  test "should get step2" do
    get tutorial_step2_url
    assert_response :success
  end

end
