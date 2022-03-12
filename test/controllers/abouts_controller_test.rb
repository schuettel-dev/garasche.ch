require 'test_helper'

class AboutsControllerTest < ActionDispatch::IntegrationTest
  test '#show' do
    get about_path
    assert_response :success
  end
end
