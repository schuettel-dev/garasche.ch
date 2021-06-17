require 'test_helper'

class AshrafComponentTest < ViewComponent::TestCase
  test '#render' do
    render_inline AshrafComponent.new

    assert_selector 'h2', text: 'Man liest Ashraf Fayad'
    assert_selector 'button', text: 'Previous'
    assert_selector 'button', text: 'Next'
    assert_selector 'img', count: 3
  end
end
