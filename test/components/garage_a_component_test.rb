require 'test_helper'

class GarageAComponentTest < ViewComponent::TestCase
  test '#render' do
    render_inline GarageAComponent.new

    assert_selector 'h2', text: 'Garage A'
    assert_selector 'h3', text: 'Bar'
    assert_selector 'h3', text: 'Hinterschtübli'
  end
end
