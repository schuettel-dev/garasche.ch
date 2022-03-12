require 'test_helper'

class HeaderComponentTest < ViewComponent::TestCase
  test '#render' do
    render_inline HeaderComponent.new
    assert_selector 'svg'
  end
end
