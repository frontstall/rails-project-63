# frozen_string_literal: true

autoload :Html, "./lib/hexlet_code/html"

# represents html tag
class Tag
  include Html

  def initialize(name, attrs)
    @name = name
    @attrs = attrs
    @children = yield if block_given?
  end
end
