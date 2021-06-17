require 'test_helper'

class OpeningHoursComponentTest < ViewComponent::TestCase
  test '#render' do
    travel_to '2021-06-23' do
      component = OpeningHoursComponent.new
      render_inline component

      assert component.open?
      assert_text "Today we're open from 16:00 to 00:00"
    end

    travel_to '2021-06-21' do
      component = OpeningHoursComponent.new
      render_inline component

      assert_not component.open?
      assert_text "Today we're closed"
    end
  end
end
