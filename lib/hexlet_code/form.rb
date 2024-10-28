# frozen_string_literal: true

# creating forms from data
class Form
  def initialize(model, attrs)
    @model = model
    @attrs = attrs.except :url
    @attrs[:action] = attrs[:url] || '#'
    @attrs[:method] ||= 'post'
    @content = []
  end

  def input(name, attrs = {})
    rest_attrs = attrs.except :as
    rest_attrs[:name] = name
    rest_attrs[:id] ||= name

    tags = create_tags attrs[:as] || :textinput, @model.send(name), rest_attrs
    @content.concat tags
  end

  def submit(text = 'Save')
    submit_btn = Tag.new 'input', type: 'submit', value: text
    @content << submit_btn
  end

  def to_html
    form = Tag.new 'form', @attrs do
      @content
    end

    form.to_html
  end

  private

  def create_tags(name, value, attrs)
    case name
    when :text
      textarea value, attrs
    when :textinput
      textinput value, attrs
    else
      raise 'Unknown method name'
    end
  end

  def textarea(value, attrs)
    attrs[:cols] ||= 20
    attrs[:rows] ||= 40

    [
      label(attrs[:id], attrs[:name]),
      Tag.new('textarea', attrs) do
        value
      end
    ]
  end

  def textinput(value, attrs)
    [
      label(attrs[:id], attrs[:name]),
      Tag.new('input', attrs.merge(type: 'text', value:))
    ]
  end

  def label(id, text)
    Tag.new 'label', for: id do
      text.capitalize
    end
  end
end
