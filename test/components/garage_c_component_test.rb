require 'test_helper'

class GarageCComponentTest < ViewComponent::TestCase
  test '#render' do
    render_inline GarageCComponent.new

    assert_selector 'h2', text: 'Garage C'
    assert_selector 'h3', text: 'cuisine'
    assert_selector 'h3', text: 'catering Rebeccas Küche'
  end
end
