require 'test_helper'

class MenuComponentTest < ViewComponent::TestCase
  test '#render' do
    render_inline MenuComponent.new
    assert_selector 'a', count: 2
  end
end
