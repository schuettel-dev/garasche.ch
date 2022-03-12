require 'test_helper'

class MenuLinkComponentTest < ViewComponent::TestCase
  test '#render, /' do
    render_inline MenuLinkComponent.new('Home', '/', %r{^/$})
    assert_no_link 'Home'
  end

  test '#render, /about' do
    render_inline MenuLinkComponent.new('About', '/about', %r{^/about$})
    assert_link 'About', href: '/about'
  end
end
