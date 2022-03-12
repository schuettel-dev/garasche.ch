require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :rack_test

  def using_browser(&block)
    Capybara.using_driver(:selenium_headless, &block)
  end
end
