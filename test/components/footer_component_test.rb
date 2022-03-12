require 'test_helper'

class FooterComponentTest < ViewComponent::TestCase
  test '#render' do
    render_inline FooterComponent.new

    assert_selector 'h2', text: 'Address'
    assert_selector 'h2', text: 'Opening hours'
  end
end
