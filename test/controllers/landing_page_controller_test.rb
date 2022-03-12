require 'test_helper'

class LandingPageControllerTest < ActionDispatch::IntegrationTest
  test '#show' do
    get root_path
    assert_response :success
  end
end
