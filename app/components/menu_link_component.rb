class MenuLinkComponent < ViewComponent::Base
  def initialize(name, path, current_if_pattern = nil, options = {})
    @name = name
    @path = path
    @current_if_pattern = current_if_pattern
    @options = options
  end

  def current?
    request.fullpath.match?(@current_if_pattern)
  end
end
