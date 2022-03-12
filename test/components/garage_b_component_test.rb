require 'test_helper'

class GarageBComponentTest < ViewComponent::TestCase
  test '#render' do
    render_inline GarageBComponent.new

    assert_selector 'h2', text: 'Garage B'
    assert_selector 'h3', text: 'Bed'
    assert_selector 'table', count: 1
    assert_selector 'img', minimum: 3
  end
end
