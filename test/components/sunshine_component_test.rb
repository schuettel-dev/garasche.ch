require 'test_helper'

class SunshineComponentTest < ViewComponent::TestCase
  test '#render' do
    render_inline SunshineComponent.new
    assert_selector '.sunshine'
  end
end
