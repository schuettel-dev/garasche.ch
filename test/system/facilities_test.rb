require 'application_system_test_case'

class FacilitiesTest < ApplicationSystemTestCase
  test 'visits facilities page' do
    using_browser do
      visit '/'
      click_on 'Facilities'

      assert_selector 'h2', text: 'Garage A'
      assert_selector 'h3', text: 'Bar'
      assert_selector 'h3', text: 'Hinterschtübli'
      assert_selector 'button.current-facility-button', text: 'Garage A'

      click_on 'Garage B'
      assert_selector 'h2', text: 'Garage B'
      assert_selector 'h3', text: 'Bed'
      assert_selector 'button.current-facility-button', text: 'Garage B'

      click_on 'Garage C'
      assert_selector 'h2', text: 'Garage C'
      assert_selector 'h3', text: 'cuisine'
      assert_selector 'h3', text: 'catering Rebeccas Küche'
      assert_selector 'button.current-facility-button', text: 'Garage C'

      refresh

      assert_selector 'h2', text: 'Garage C'
    end
  end
end
