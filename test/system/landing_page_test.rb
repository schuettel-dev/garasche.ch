require 'application_system_test_case'

class LandingPageTest < ApplicationSystemTestCase
  test 'visits landing page' do
    using_browser do
      visit '/'
      assert_selector 'h2', text: 'Man liest Ashraf Fayad'
      assert_selector 'img', count: 1

      # first image
      assert_selector 'button', text: 'Previous', count: 0
      assert_selector 'button', text: 'Next', count: 1

      # forward to second image
      click_on 'Next'
      assert_selector 'button', text: 'Previous', count: 1
      assert_selector 'button', text: 'Next', count: 1

      # forward to third (last) image
      click_on 'Next'
      assert_selector 'button', text: 'Previous', count: 1
      assert_selector 'button', text: 'Next', count: 0

      # back to second image
      click_on 'Previous'
      assert_selector 'button', text: 'Previous', count: 1
      assert_selector 'button', text: 'Next', count: 1

      # back to first image
      click_on 'Previous'
      assert_selector 'button', text: 'Previous', count: 0
      assert_selector 'button', text: 'Next', count: 1
    end
  end
end
