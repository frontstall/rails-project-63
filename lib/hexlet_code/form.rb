# frozen_string_literal: true

require_relative "field"

# creating forms from data
class Form
  include Field

  def initialize(model, attrs)
    @model = model
    @attrs = attrs.except :url
    @attrs[:action] = attrs[:url] || "#"
    @attrs[:method] ||= "post"
    @content = []
  end

  def to_s
    HexletCode::Tag.build "form", @attrs do
      @content.join
    end
  end
end
