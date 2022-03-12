require 'test_helper'

class FacilitiesControllerTest < ActionDispatch::IntegrationTest
  test '#index' do
    get facilities_path
    assert_response :success
  end
end
