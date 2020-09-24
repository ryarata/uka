require 'test_helper'

class PresentationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @presentation = presentations(:one)
  end

  test "should get index" do
    get _presentations_url
    assert_response :success
  end

  test "should get new" do
    get new__presentation_url
    assert_response :success
  end

  test "should create presentation" do
    assert_difference('Presentation.count') do
      post _presentations_url, params: { presentation: {  } }
    end

    assert_redirected_to presentation_url(Presentation.last)
  end

  test "should show presentation" do
    get _presentation_url(@presentation)
    assert_response :success
  end

  test "should get edit" do
    get edit__presentation_url(@presentation)
    assert_response :success
  end

  test "should update presentation" do
    patch _presentation_url(@presentation), params: { presentation: {  } }
    assert_redirected_to presentation_url(@presentation)
  end

  test "should destroy presentation" do
    assert_difference('Presentation.count', -1) do
      delete _presentation_url(@presentation)
    end

    assert_redirected_to _presentations_url
  end
end
