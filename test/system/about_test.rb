require 'application_system_test_case'

class AboutTest < ApplicationSystemTestCase
  test 'visits about page' do
    visit '/'
    click_on 'About'

    assert_selector 'h1', text: 'Geschichte'
    assert_selector 'h2', text: 'Members'
  end
end
