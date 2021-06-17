require 'test_helper'

class ContentComponentTest < ViewComponent::TestCase
  test '#render' do
    render_inline ContentComponent.new(data: 'Yes')
    assert_text 'Yes'
  end
end
